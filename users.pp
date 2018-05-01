
group { 'supercool':
  ensure => 'present',
  gid    => '8765',
}
user { 'jusong':
  ensure => present,
  uid => '2030',
  gid => '8765',
  comment => 'user jusong belongs to group supercool',
  managehome => true,
  password => 'chen@^8373',
}
user { 'chen':
  ensure => present,
  uid => '2040',
  gid => '8765',
  comment => 'user chen belongs to group supercool',
  managehome => true,
  password => 'Jes*&373',
}

