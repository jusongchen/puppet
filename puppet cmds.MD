
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

file
user
mailalias




# apply

puppet apply hello.pp
sudo puppet apply joe.pp


#query
sudo puppet resource user joe

puppet resource maialias postmaster


#linux cmd

#oct dump to see file content
od -c /tmp/testfile.txt
