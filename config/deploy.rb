# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "HomeAssistant"
set :repo_url, "git@github.com:atmattpatt/hass"

ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :deploy_to, "/volume1/docker/homeassistant"
set :tmp_dir, "/volume1/docker/homeassistant/tmp/capistrano"

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
