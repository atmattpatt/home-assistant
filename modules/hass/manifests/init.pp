file { '/home-assistant/config/configuration.yaml':
  ensure => file,
  source => 'puppet:///modules/hass/configuration.yaml'
}
