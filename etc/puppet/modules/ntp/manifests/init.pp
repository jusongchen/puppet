class ntp {
  $ntp_servers=['time.apple.com', 'us.pool.ntp.org', 'time.nist.gov']

  $ntp_srv_name = $::osfamily ? {
    'RedHat' => 'ntpd',
    'Debian' => 'ntp',
    default => 'ntpd',
  }

# -> before/require relationship
# ~> notify/subscribe relationship
Package ['ntp']-> File ['/etc/ntp.conf']~>Service[$ntp_srv_name]

  package { 'ntp':
    ensure => present,
  }
  file {'/etc/ntp.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
   # source => 'puppet:///modules/ntp/ntp.conf',
    content => template('ntp/ntp.conf.erb'),
  }
  service {$ntp_srv_name:
    ensure => running,
    enable => true, #this will tell system to start this service when reboot
  }
}
