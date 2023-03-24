class homeassistant::timers {
  file { '/homeassistant/config/timers.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/timers.yaml',
  }
}
