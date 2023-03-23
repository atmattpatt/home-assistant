class homeassistant {
  file { '/homeassistant/config/configuration.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/configuration.yaml',
  }

  include homeassistant::light_groups
  include homeassistant::scenes
  include homeassistant::timers
}
