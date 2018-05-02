
notify { 'greeting':
   message => "Hello, world! your OS family is $::osfamily", #variable in single quote string will be not evaluated!
}


notify { 'greeting-with-external-facts':
   message => "Hello, world! your site is $::site , location at $::location and your name is $::my_name", 
}
