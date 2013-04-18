class bind::package {
  package {'bind9':
    ensure => latest
  }
}