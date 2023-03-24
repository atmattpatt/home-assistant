class homeassistant::inputs {
  file { '/homeassistant/config/inputs':
    ensure  => directory,
    source  => 'puppet:///modules/homeassistant/inputs',
    recurse => true,
    purge   => true,
  }
}
