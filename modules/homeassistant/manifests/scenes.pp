class homeassistant::scenes {
  file { '/homeassistant/config/scenes.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/scenes.yaml',
  }
}
