class homeassistant {
  file { '/homeassistant/config/configuration.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/configuration.yaml'
  }
}
