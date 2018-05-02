
notify { 'greeting':
   message => 'Hello, world! your OS family is $::osfamily',
}
