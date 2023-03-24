class homeassistant::templates {
  file { '/homeassistant/config/template':
    ensure  => directory,
    source  => 'puppet:///modules/homeassistant/template',
    recurse => true,
    purge   => true,
  }
}
