{
  /* ---- SECURITY ---- */
  security.auditd.enable = true; # enable the Linux Audit daemon
  services.sysstat.enable = true; # performance monitoring tools
  
  # Disable unused protocols:
  boot.extraModprobeConfig = ''
    install tipc /bin/true
    install rds /bin/true
    install sctp /bin/true
    install dccp /bin/true
  '';
  
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
  in 
  listToAttrs [
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
    (commonConfig "auditd")
    (dmConfig "display-manager")
    # (commonConfig cups)
    # (commonConfig cups-browsed)
    # (commonConfig NetworkManager)
    # (commonConfig NetworkManager-dispatcher)
  ];
}
