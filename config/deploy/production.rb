set :pty, true

set :hass_config_path, "#{fetch(:deploy_to)}/config"

set :ignored_files, [".yamllint.yaml"]
set :managed_config_files, %x[git ls-files "*.yaml"].lines.map(&:strip) - fetch(:ignored_files)

server "synology-a9e3", user: "synologyadmin", roles: %w[hass], ssh_options: {
  forward_agent: true,
  verify_host_key: :never,
}

task :ask_password do
  on roles(:hass) do
    sudo "/bin/true"
  end
end

task :copy_config_files do
  directories = fetch(:managed_config_files).map do |config_file|
    File.dirname(config_file)
  end.uniq

  on roles(:hass) do
    directories.each do |directory|
      execute "mkdir -p #{fetch(:hass_config_path)}/#{directory}"
    end

    fetch(:managed_config_files).each do |filename|
      execute "cp -f #{current_path}/#{filename} #{fetch(:hass_config_path)}/#{filename}"
    end
  end
end

task :upload_secrets do
  on roles(:hass) do
    upload! "secrets.yaml", "#{fetch(:hass_config_path)}/secrets.yaml"
  end
end

namespace :hass do
  task :check_config do
    on roles(:hass) do
      sudo "/usr/local/bin/docker exec home-assistant hass --config /config --script check_config --secrets"
    end
  end

  task :restart do
    on roles(:hass), in: :sequence do
      sudo "/usr/local/bin/docker restart home-assistant"
    end
  end
end

namespace :deploy do
  before :updating, :ask_password
  before :published, :upload_secrets
  after :published, :copy_config_files
  after :published, :"hass:check_config"
  after :published, :"hass:restart"
end

# Git is not on the PATH when Capistrano SSHs to the server and trying to use
# a login shell does not affect the PATH for some reason. This ensures that
# Git is accessible to Capistrano.
task :symlink_git do
  on roles(:hass) do
    unless test("which git")
      sudo "ln -s /usr/local/bin/git /usr/bin/git"
    end
    execute "git --version"
  end
end

namespace :git do
  before :check, :symlink_git
end
