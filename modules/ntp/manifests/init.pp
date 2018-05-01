class ntp {
  
  Package ['ntp']-> File ['/etc/ntp.conf']~>Serivce['ntpd']
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
    source => 'puppet:///modules/ntp/ntp.conf',
  }
  service {'ntpd':
    ensure => running,
    enable => true, #this will tell system to start this service when reboot
  }
}
