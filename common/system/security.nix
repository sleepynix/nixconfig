{lib, ...}:

{
  /* ---- SECURITY ---- */
  # Disable unused protocols:
  boot.extraModprobeConfig = ''
    install tipc /bin/true
    install rds /bin/true
    install sctp /bin/true
    install dccp /bin/true
  '';
  
  # Sysstat: performance monitoring tools
  services.sysstat.enable = true;
  
  # Auditd: Linux Audit daemon
  security.auditd.enable = true; # see also auditdConfig below
  # Create /etc/audit/auditd.conf and audit.rules files
  # with settings copied from Fedora 40:
  environment.etc = {
    "audit/auditd.conf".text = ''
      local_events = yes
      write_logs = yes
      log_file = /var/log/audit/audit.log
      log_group = root
      log_format = ENRICHED
      flush = INCREMENTAL_ASYNC
      freq = 50
      max_log_file = 8
      num_logs = 5
      priority_boost = 4
      name_format = NONE
      ##name = mydomain
      max_log_file_action = ROTATE
      space_left = 75
      space_left_action = SYSLOG
      verify_email = yes
      action_mail_acct = root
      admin_space_left = 50
      admin_space_left_action = SUSPEND
      disk_full_action = SUSPEND
      disk_error_action = SUSPEND
      use_libwrap = yes
      ##tcp_listen_port = 60
      tcp_listen_queue = 5
      tcp_max_per_addr = 1
      ##tcp_client_ports = 1024-65535
      tcp_client_max_idle = 0
      transport = TCP
      krb5_principal = auditd
      ## krb5_key_file = /etc/audit/audit.key
      distribute_network = no
      q_depth = 2000
      overflow_action = SYSLOG
      max_restarts = 10
      ## plugin_dir = /etc/audit/plugins.d
      end_of_event_timeout = 2
    '';
    "audit/audit.rules".text = ''
      ## This set of rules is to suppress the performance effects of the
      ## audit system. The result is that you only get hardwired events.
      -D

      ## This suppresses syscall auditing for all tasks started
      ## with this rule in effect.  Remove it if you need syscall
      ## auditing.
      -a task,never
    '';
  };
  
  # -- Systemd Services -- #
  systemd.services = with builtins;
  let
    commonConfig = service: {
      name = service;
      value = {
        serviceConfig = {
          ProtectSystem = "strict";
          ProtectHome = true;
          ProtectHostname= true;
          ProtectKernelTunables = true;
          ProtectKernelModules = true;
          ProtectControlGroups = true;
          ProtectKernelLogs = true;
          ProtectClock = true;
          ProtectProc = "invisible"; 
          ProcSubset = "pid"; 
          PrivateTmp = true;
          MemoryDenyWriteExecute = true;
          NoNewPrivileges = true;
          LockPersonality = true;
          RestrictRealtime = true;
          UMask = "0077";
        };
      };
    };
    dmConfig = service: {
      name = service;
      value = {
        serviceConfig = {
          ProtectKernelTunables = true;
          ProtectKernelModules = true; 
          ProtectKernelLogs = true;
        };
      };
    };
    auditdConfig = service: {
      name = service;
      value = {
        serviceConfig = {
          LogsDirectory = "audit";
          ProtectSystem = "strict";
          ProtectHome = true;
          ProtectHostname= true;
          ProtectKernelTunables = true;
          ProtectKernelModules = true;
          ProtectControlGroups = true;
          ProtectKernelLogs = true;
          ProtectClock = true;
          ProtectProc = "invisible"; 
          ProcSubset = "pid"; 
          PrivateTmp = true;
          MemoryDenyWriteExecute = true;
          NoNewPrivileges = true;
          LockPersonality = true;
          RestrictRealtime = true;
          UMask = "0077";
        };
      };
    };
  in 
  builtins.listToAttrs [
    (commonConfig "systemd-rfkill")
    (commonConfig "emergency")
    (commonConfig "getty@tty1")
    (commonConfig "getty@tty7")
    (commonConfig "dbus")
    (commonConfig "reload-systemd-vconsole-setup")
    (commonConfig "rescue")
    (commonConfig "podman")
    (commonConfig "plymouth-start")
    (commonConfig "avahi-daemon")
    (commonConfig "autovt@tty1")
    (commonConfig "systemd-ask-password-console")
    (commonConfig "systemd-ask-password-plymouth")
    (commonConfig "systemd-ask-password-wall")
    (commonConfig "thermald")
    (auditdConfig "auditd")
    (dmConfig "display-manager")
    # (commonConfig "cups")
    # (commonConfig "cups-browsed")
    # (commonConfig "NetworkManager")
    # (commonConfig "NetworkManager-dispatcher")
  ];
}
