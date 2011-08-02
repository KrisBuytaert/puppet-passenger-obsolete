class passenger (
	$webserver = 'httpd'
) {
  # Package is available only for RedHat and CentOS 5 
  package {
    "rubygem-passenger": 
       ensure => "2.2.2-1",
       require => Package["$webserver"],
       before => Service["$webserver"],
  }

  file {
    "/etc/httpd/conf.d/passenger.conf":
      source => "puppet:///modules/passenger/passenger.conf",
      mode => 644,
      owner=> root,
      group => root,
      notify => Service ["$webserver"],
  }
}
