define bind::zonefile(
  $ensure = 'present',
  $owner = 'root',
  $group = 'bind',
  $mode  = '0644',
  $source_base
) {
  file {"${bind::zones::mastersdir}/${name}":
    ensure => $ensure,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
    source => "${source_base}${name}"
  }
}