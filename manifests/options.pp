class bind::options(
  $ensure = 'present',
  $directory = '/var/cache/bind',
  $recursion = 'no',
  $listen_on = ['any'],
  $listen_on_v6 = undef
) inherits bind {

  file {"${bind::conf}/named.conf.options":
    owner => 'root',
    group => 'bind',
    mode  => '0640',
    content => template('bind/options.erb'),
    require => Class['bind::package'],
    notify  => Class['bind::service']
  }
}