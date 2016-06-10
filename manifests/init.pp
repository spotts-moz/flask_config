node default {
    exec { 'apt-update':
      command => '/usr/bin/apt-get update',
    }

    Exec["apt-update"] -> Package <| |>

    include users
    include nginx
    include python
    include uwsgi
    include utils
    include git
    include cron
    class { 'Git::Clone':
             repo => "https://github.com/spotts-moz/flask_app",
             dpath => "/var/www/${hostname}.${domain}/src",
           }
   class { 'Git::Clone':
             repo => "https://github.com/spotts-moz/flask_config",
             dpath => "/etc/puppet/",
           }

}
