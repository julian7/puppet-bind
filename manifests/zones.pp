class bind::zones(
  $masters = [],
  $slaves = {},
  $source_base
) inherits bind {
  $mastersdir = "${bind::conf}/master"
  $slavesdir = "${bind::conf}/slave"

  file {"${bind::conf}/named.conf.local":
    owner => 'root',
    group => 'bind',
    mode  => '0640',
    content => template('bind/zones.erb'),
    require => Class['bind::package'],
    notify  => Class['bind::service']
  }

  bind::zonefile {$masters:
    owner => 'root',
    group => 'bind',
    mode  => '0640',
    source_base => $source_base
  }
}