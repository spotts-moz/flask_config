include python
include python::packages

class python {
    include python::packages

    package { 'python':
        ensure => '2.7.5-5ubuntu3',
    }
}

class python::packages {
    $apt = ['python-pip', 'build-essential', 'python-dev',  ]

    package { $apt:
        require => Class['python'],
        ensure => installed,
    }

    package { 'flask':
        ensure =>  0.10,
        provider => pip,
    }
}
