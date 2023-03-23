class homeassistant {
  file { '/homeassistant/config/configuration.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/configuration.yaml',
  }

  file { '/homeassistant/config/scenes.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/scenes.yaml',
  }
}
