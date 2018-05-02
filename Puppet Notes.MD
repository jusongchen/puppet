
Instructor : Rich Remington, rich.remington@gmail.com
Date: May 1st,2018


https://www.rich-software.com/training/puppet/

My Puppet Master

ssh student@54.215.180.40 PW sfstudent

my class host setup:
master:54.215.180.40
Agent:13.57.31.241
ssh student@13.57.31.241


Install puppet first:
Centos, Redhat - yum
Ubuntu - aptget



# Puppet doc
[3.8 Home page](https://docs.puppet.com/puppet/3.8/)


## Puppet Resource Types
[Puppet resource](https://docs.puppet.com/puppet/3.8/type.html)

##Core Resource Type
* notify
* file
* user
* group
* package
* service
* exec
* cron/scheduled_task



# apply

puppet apply hello.pp
sudo puppet apply joe.pp


#query
sudo puppet resource user joe

puppet resource maialias postmaster


#linux cmd

#oct dump to see file content
od -c /tmp/testfile.txt


#question

How to find the default package provider?


# module

sudo puppet config print modulepath


# facter

to get configurations, run cmd
facter --json

external facts
/etc/facter/facts.d/foo.{txt,yaml,json}
sudo mkdir -p /etc/facter/facts.d

make sure facter variables start with lower case letter!

# ntp
## to query ntp peer
ntpq -4 -p


# master - agent setup
master IP and host:
10.0.0.186 ip-10-0-0-186.us-west-1.compute.internal

## on Agent
add this to /etc/hosts at agent:
10.0.0.186 ip-10-0-0-186.us-west-1.compute.internal ip-10-0-0-186

vi /etc/puppet/puppet.conf
### add this entry
server=ip-10-0-0-186.us-west-1.compute.internal

### test - try to connect to master as an agent 
student@ip-10-0-0-225:~$ sudo puppet agent -t
Info: Creating a new SSL key for ip-10-0-0-225.us-west-1.compute.internal
Info: Caching certificate for ca
Info: csr_attributes file loading from /etc/puppet/csr_attributes.yaml
Info: Creating a new SSL certificate request for ip-10-0-0-225.us-west-1.compute.internal
Info: Certificate Request fingerprint (SHA256): A9:E3:F1:5F:8A:3E:2D:3C:D8:BB:E2:23:39:18:4E:11:87:47:C3:22:AF:F9:DC:26:E6:A0:E0:33:4A:5D:B3:D2
Info: Caching certificate for ca

## on master
$ sudo puppet cert list
  "ip-10-0-0-225.us-west-1.compute.internal" (SHA256) A9:E3:F1:5F:8A:3E:2D:3C:D8:BB:E2:23:39:18:4E:11:87:47:C3:22:AF:F9:DC:26:E6:A0:E0:33:4A:5D:B3:D2
student at ip-10-0-0-186 in ~/manifests on May2AM
$ sudo puppet cert sign --all
Notice: Signed certificate request for ip-10-0-0-225.us-west-1.compute.internal
Notice: Removing file Puppet::SSL::CertificateRequest ip-10-0-0-225.us-west-1.compute.internal at '/var/lib/puppet/ssl/ca/requests/ip-10-0-0-225.us-west-1.compute.internal.pem'


## on Agent test to connect master

student@ip-10-0-0-225:~$ sudo puppet agent -t
Info: Retrieving pluginfacts
Info: Retrieving plugin
Info: Caching catalog for ip-10-0-0-225.us-west-1.compute.internal
Info: Applying configuration version '1525288342'
