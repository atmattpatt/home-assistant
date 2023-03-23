class homeassistant {
  service { 'home-assistant':
    hasstatus  => false,
    hasrestart => true,
    restart    => 'docker restart home-assistant',
  }

  file { '/homeassistant/config/configuration.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/configuration.yaml',
    notify => Service['home-assistant'],
  }
}
