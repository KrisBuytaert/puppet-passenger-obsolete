class passenger {
  # just in case apache is not included.

  # Package is avail be only for Red Hat CentOS 5 
  package{"rubygem-passenger": 
    ensure => "2.2.2-1",
    require => Package["httpd"],
    before => Service["httpd"],
  }

  file{"/etc/httpd/conf.d/passenger.conf":
    source => "puppet:///modules/passenger/passenger.conf",
    mode => 644, owner=> root, group => root,
    notify => Service ["httpd"],
  }
}
