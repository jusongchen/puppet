user { 'joe':
 ensure => present,
 uid => '2000',
 gid => '10',
 comment => 'Joe User',
 managehome => true,
 password => 'Jes*&@^8373',
}
