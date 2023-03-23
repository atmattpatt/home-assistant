class homeassistant::sensors {
  file { '/homeassistant/config/sensor':
    ensure  => directory,
    source  => 'puppet:///modules/homeassistant/sensor',
    recurse => true,
    purge   => true,
  }
}
