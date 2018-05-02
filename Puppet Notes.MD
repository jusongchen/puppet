
Instructor : Rich Remington, rich.remington@gmail.com
Date: May 1st,2018


https://www.rich-software.com/training/puppet/

My Puppet Master

ssh student@54.215.180.40 PW sfstudent

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
