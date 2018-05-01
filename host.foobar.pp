host { 'foobar.com':
  ensure       => 'present',
  name =>   'foo'
  host_aliases => ['fooserver'],
  ip           => '1.2.3.4',
  target       => '/etc/hosts',
  comment      => 'A test host created by puppet',
}
host { 'foobar2.com':
  ensure       => 'present',
  name =>   'foo'
  host_aliases => ['fooserver'],
  ip           => '1.2.3.4',
  target       => '/etc/hosts',
  comment      => 'A test host created by puppet',
}
