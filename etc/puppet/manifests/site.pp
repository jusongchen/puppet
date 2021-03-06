
File {
 mode => '0600',
}

# evaluated as case statement - only the first matched one get executed!

# node /.*\.us-west.*\.internal$/ {
#   include ntp
#   notify { "${clientcert} is matched to deploy ntp": }
# }

node /ip-10-0-0-.*us-west-1.compute.internal/ {
	include users # deploy modules users to agent specified by the node

  #ntp need parameters
  class {'ntp':
    ntp_servers => ['time.apple.com', 'us.pool.ntp.org', 'time.nist.gov'],
  }
  notify { "${clientcert} is matched to regexp /ip-10-0-0-.*us-west-1.compute.internal": }
}

node default {
  notify { "${clientcert} is not classified": }
}
