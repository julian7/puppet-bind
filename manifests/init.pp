class bind {
  $conf = '/etc/bind'

  include bind::files
  include bind::package
  include bind::service
}