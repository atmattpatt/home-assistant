class homeassistant {
  file { '/homeassistant/config/configuration.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/configuration.yaml',
  }

  include homeassistant::automations
  include homeassistant::binary_sensors
  include homeassistant::inputs
  include homeassistant::light_groups
  include homeassistant::scenes
  include homeassistant::sensors
  include homeassistant::templates
  include homeassistant::timers
}
