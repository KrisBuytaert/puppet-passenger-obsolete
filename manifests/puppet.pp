class passenger::puppet {



package  { "rubygem-rack":
		ensure => installed 
}


file {
	"/etc/httpd/conf.d/puppetmaster.conf":
		source => "puppet:///modules/passenger/puppetmaster.conf",	
	  	notify => Service["httpd"];

	"/usr/share/puppet/rack":
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd":
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd/public": 
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd/tmp":
		ensure => directory;
	"/usr/share/puppet/rack/puppetmasterd/config.ru":
		source => "/usr/share/puppet/ext/rack/files/config.ru",
		owner => puppet;
	}



}
