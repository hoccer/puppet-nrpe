class nrpe::config {

  require nrpe::install

  line { "allowed_hosts" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "allowed_hosts=127.0.0.1,192.76.129.23,80.82.201.36,80.82.201.37,80.82.201.38",
    notify => Class["nrpe::service"],
  }

  line { "check_apt" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_apt]=sudo /usr/lib/nagios/plugins/check_apt -u -t 120",
    notify => Class["nrpe::service"],
  }

  line { "check_disk_root" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_disk_root]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /",
    notify => Class["nrpe::service"],
  }

  line { "check_total_procs" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_total_procs]=/usr/lib/nagios/plugins/check_procs -w ${processorcount * 50 + 200} -c ${processorcount * 50 + 500}",
    notify => Class["nrpe::service"],
  }

  line { "check_load" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_load]=/usr/lib/nagios/plugins/check_load -w ${processorcount},${processorcount - 5},${processorcount - 10} -c ${processorcount + 15},${processorcount + 10},${processorcount + 5}",
    notify => Class["nrpe::service"],
  }

  line { "check_megaraid" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_megaraid]=/usr/lib/nagios/plugins/check_megaraid_sas -s 1",
    notify => Class["nrpe::service"],
  }

  file { "/etc/sudoers.d/megaraid":
    owner   => root,
    group   => root,
    mode    => 440,
    content => "nagios ALL=(ALL) NOPASSWD:/usr/sbin/megacli
",
  }

  line { "check_proc_talkserver" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_proc_talkserver]=service talkserver status",
    notify => Class["nrpe::service"],
  }

  line { "check_proc_filecache" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_proc_filecache]=service filecache status",
    notify => Class["nrpe::service"],
  }

  line { "check_proc_nginx" :
    file => "/etc/nagios/nrpe_local.cfg",
    line => "command[check_proc_nginx]=/usr/lib/nagios/plugins/check_procs -a nginx -w 1:10 -c 1:10",
    notify => Class["nrpe::service"],
  }

}
