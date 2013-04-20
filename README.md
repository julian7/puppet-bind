# bind9 puppet module

This module targets Ubuntu (12.04 onwards) Bind 9 DNS setups. Extracted
from my puppetmaster.

OpenBSD support is likely (since my secondary is an OpenBSD server).

## Usage

Basic setup:

```puppet
include bind
class {bind::options:
  # ...
}
```

`bind::options` class takes the following parameters:

* directory: working directory
* recursion: true if you want to serve DNS for other hosts, false for
  serving only your zones for other DNS servers.
* listen\_on: accepts DNS requests on these IPv4 addresses (default:
  ['any']). Requires array.
* listen\_on\_v6: accepts DNS requests on these IPv6 addresses (defoult:
  unset). When set, requires array.

and then define zones:

```puppet
class {bind::zones:
  masters => ['example.com', 'foobar.biz'],
  slaves => {
    'slave.domain' => ['ma.st.er.ip'],
    'another.slave' => ['1.2.3.4', '5.6.7.8']
  },
  source_base => 'puppet:///path/to/bind/zores/dir/'
}
```

bind::zones class takes the following parameters:

* masters: array of domain names served by the local host. Files will be
  deployed to /etc/bind/master/&lt;*domain name*&gt;
* slaves: hash of domain-master IP pairs. Master IP addresses have to be
  given in an array.
* source\_base: this is the directory where puppet gets zone files from.
  Zone files are named from domain names.

## Copyright

Copyright &copy; Balazs Nagy, released under the MIT license
