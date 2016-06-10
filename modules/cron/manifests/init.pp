class cron {
file { "run_puppet.cron":
    path    => "/etc/cron.d/run_puppet.cron",
    ensure  => present,
    owner   => "root",
    group   => "root",
    mode    => 0644,
    content => "*/5 * * * * root  puppet apply /etc/puppet/manifests/init.pp \n";
}
}
