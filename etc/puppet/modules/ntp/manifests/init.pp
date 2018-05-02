class ntp {
  $ntp_servers=['time.apple.com', 'us.pool.ntp.org', 'time.nist.gov']

  Package ['ntp']-> File ['/etc/ntp.conf']~>Service['ntpd']
# ~> notify/subscribe relationship
# -> before/require relationshipt
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
  service {'ntpd':
    ensure => running,
    enable => true, #this will tell system to start this service when reboot
  }
}
