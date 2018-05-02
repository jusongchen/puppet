
File {
 mode => '0600',
}

node 'ip-10-0-0-225.us-west-1.compute.internal' {
	include users
  #include users - deploy modules users to agent specified by the node
}

node /.*\.us-west.*\.internal$/ {
  include ntp
}

node default {
  notify { "${clientcert} is not classified": }
}
