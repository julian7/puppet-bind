class bind::files inherits bind {
  File {
    owner => 'root',
    group => 'bind',
    mode  => '0640'
  }

  $confd = $bind::conf

  file {
    '/etc/default/bind9':
      ensure  => present,
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/bind/default',
      require => Class['bind::package']
      ;
    [$confd, "${confd}/master"]:
      ensure  => directory,
      mode    => '02755',
      require => Class['bind::package']
      ;
    "${confd}/slave":
      ensure  => link,
      target  => '/var/cache/bind/slave',
      require => File[$confd]
      ;
    "${confd}/named.conf":
      ensure  => present,
      source  => 'puppet:///modules/bind/named.conf',
      require => File[$confd],
      notify  => Class['bind::service']
      ;
    "${confd}/named.conf.default-zones":
      ensure => present,
      source => 'puppet:///modules/bind/named.conf.default-zones',
      require => File[$confd],
      notify  => Class['bind::service']
      ;
  }
}