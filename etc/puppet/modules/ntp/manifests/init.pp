class ntp (
  $isserver = true,
  $isclient = false,
  $ntp_servers,
)
{
# the ntp servers will be passed in as parameters
# $ntp_servers=['time.apple.com', 'us.pool.ntp.org', 'time.nist.gov']

#set ntp_srv_name by querying value of $::osfamily
#for RedHat the ntp service named ntpd
#for Ubuntu the ntp service name is ntp
  $ntp_srv_name = $::osfamily ? {
    'RedHat' => 'ntpd',
    'Debian' => 'ntp',
    default => 'ntpd',
  }

# -> before/require relationship
# ~> notify/subscribe relationship
Package ['ntp']-> File ['/etc/ntp.conf']~>Service[$ntp_srv_name]

if $isserver {
  notify { 'server-notification':
    message => "You are a NTP server located at $::location", 
  }
}

if $isclient {
  notify { 'client-notification':
    message => "You are a NTP client located at $::location", 
  }
}

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
