class bind::service($ensure = 'running') {
  include bind::files
  service {'bind9':
    ensure     => $ensure,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [Class['bind::files'], Class['bind::zones'], Class['bind::options']]
  }
}