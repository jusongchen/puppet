
File {
 mode => '0600',
}

# evaluated as case statement - only the first matched one get executed!

node /.*\.us-west.*\.internal$/ {
  include ntp
  notify { "${clientcert} is matched to deploy ntp": }
}

node 'ip-10-0-0-225.us-west-1.compute.internal' {
	include users # deploy modules users to agent specified by the node
  notify { "${clientcert} is matched to deploy module users": }
}

node default {
  notify { "${clientcert} is not classified": }
}
