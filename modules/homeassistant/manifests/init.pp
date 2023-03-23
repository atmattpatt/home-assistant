class homeassistant {
  file { '/homeassistant/config/configuration.yaml':
    ensure => file,
    source => 'puppet:///modules/hass/configuration.yaml'
  }
}
