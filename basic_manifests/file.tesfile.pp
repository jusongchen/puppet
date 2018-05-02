file { '/tmp/testfile.txt':
 ensure => present,
 #mode => '0644', #
 mode => 'u=rw,g=r,o=r',
 replace => true,  #when set to false, the content won't be changed and no error message wil be reported!
 content => "wow cow!\n", #use double quote so that \n is interpreted
}
