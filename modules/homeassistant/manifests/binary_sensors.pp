class homeassistant::binary_sensors {
  file { '/homeassistant/config/binary_sensor':
    ensure  => directory,
    source  => 'puppet:///modules/homeassistant/binary_sensor',
    recurse => true,
    purge   => true,
  }
}
