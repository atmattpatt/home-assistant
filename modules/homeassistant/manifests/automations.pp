class homeassistant::automations {
  file { '/homeassistant/config/automations.yaml':
    ensure  => file,
    replace => false,
  }

  file { '/homeassistant/config/automations':
    ensure  => directory,
    source  => 'puppet:///modules/homeassistant/automations',
    recurse => true,
    purge   => true,
  }
}
