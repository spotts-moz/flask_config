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
    git::clone{
            "getflask":
             repo => "https://github.com/spotts-moz/flask_app",
             dpath => "/var/www/${hostname}.${domain}/src";
           "uppup":
             repo => "https://github.com/spotts-moz/flask_config",
             dpath => "/etc/puppet/"
           }
    exec {"restartuwsgi":
           path => [ '/bin', '/usr/bin', '/usr/local/bin','/sbin' ],
           command  => "initctl restart uwsgi",
           subscribe =>  Vcsrepo["/var/www/${hostname}.${domain}/src"],
    }
}
