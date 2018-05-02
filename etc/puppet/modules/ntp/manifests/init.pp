class ntp {
  $ntp_servers=['time.apple.com', 'us.pool.ntp.org', 'time.nist.gov']

  $ntp_srv_name = $::osfamily ? {
    'RedHat' => 'ntpd',
    'Debian' => 'ntp',
    default => 'ntpd',
  }

  #this is not flexible as ntpd will be ntp on Ubuntu osfamily
  # Package ['ntp']-> File ['/etc/ntp.conf']~>Service['ntpd']


  package { 'ntp':
    ensure => present,
  }-> # -> before/require relationshipt
  file {'/etc/ntp.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
   # source => 'puppet:///modules/ntp/ntp.conf',
    content => template('ntp/ntp.conf.erb'),
  }~>  # ~> notify/subscribe relationship
  service {$ntp_srv_name:
    ensure => running,
    enable => true, #this will tell system to start this service when reboot
  }
}
