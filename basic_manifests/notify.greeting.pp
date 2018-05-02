
notify { 'greeting':
   message => "Hello, world! your OS family is $::osfamily", #variable in single quote string will be not evaluated!
}
