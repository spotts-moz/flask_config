class git {
      package { 'git':
      ensure => installed,
      
  define clone ($repo, $dpath) {
  
    file { "${dpath}" :
      ensure  => directory,
      mode    => 0755,
    }


    vcsrepo { "${dpath}":
      ensure   => latest,
      provider => git,
      require  => [ Package["git"] ],
      source   => "${repo}.git",
      revision => 'master',
    }

  }

}
