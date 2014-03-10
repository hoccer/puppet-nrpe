class nrpe::service {

  service { 'nagios-nrpe-server':
    require   => Class['nrpe::install'],
    enable    => true,
    ensure    => running,
    pattern   => 'nrpe',
    hasstatus => false,
  }

}
