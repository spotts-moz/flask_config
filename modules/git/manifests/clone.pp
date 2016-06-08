class git::clone ($repo, $dpath) {
  file { "${dpath}" :
    ensure  => directory,
    mode    => 0755,
  }

  package { 'git':
    ensure => installed,
  }

  vcsrepo { "${dpath}":
    ensure   => latest,
    provider => git,
    require  => [ Package["git"] ],
    source   => "${repo}.git",
    revision => 'master',
  }

}
