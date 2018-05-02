
$super_group = 'supercool'

group { $super_group:
  ensure => 'present',
  gid    => '8765',
}
user { 'chen':
  ensure           => 'present',
  comment          => 'user chen belongs to group $super_group',
  gid              => '10',
  groups           => ["$super_group"],  #variables in double quote are evaluated
  home             => '/home/chen',
  password         => 'Jes*&373',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '2040',
}
user { 'jusong':
  ensure           => 'present',
  comment          => 'user jusong belongs to group supercool',
  gid              => '10',
  groups           => [$super_group],
  home             => '/home/jusong',
  password         => 'chen@^8373',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '2030',
}
