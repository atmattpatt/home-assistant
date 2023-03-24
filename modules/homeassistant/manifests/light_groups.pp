class homeassistant::light_groups {
  file { '/homeassistant/config/light-groups.yaml':
    ensure => file,
    source => 'puppet:///modules/homeassistant/light-groups.yaml',
  }
}
