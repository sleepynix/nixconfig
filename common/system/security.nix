{
  /* ---- SECURITY ---- */
  security.auditd.enable = true; # enable the Linux Audit daemon
  services.sysstat.enable = true; # performance monitoring tools
  
  # disable unused protocols:
  boot.extraModprobeConfig = ''
    install tipc /bin/true
    install rds /bin/true
    install sctp /bin/true
    install dccp /bin/true
  '';
  
  # -- systemd services -- #
  systemd.services =
  let
    commonConfig = {
      ProtectSystem = "strict";
      ProtectHome = true;
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
    };
  in {
    systemd-journald = {
      serviceConfig = {
        UMask = 0077;
        PrivateNetwork= true;
        ProtectHostname= true;
        ProtectKernelModules= true;
      };
    };
    display-manager = {
      serviceConfig = {
        ProtectKernelTunables = true;
        ProtectKernelModules = true; 
        ProtectKernelLogs = true;
      };
    };
    systemd-rfkill.serviceConfig = commonConfig;
    emergency.serviceConfig = commonConfig;
    "getty@tty1".serviceConfig = commonConfig;
    "getty@tty7".serviceConfig = commonConfig;
    "dbus".serviceConfig = commonConfig;
    reload-systemd-vconsole-setup.serviceConfig = commonConfig;
    rescue.serviceConfig = commonConfig;
    podman.serviceConfig = commonConfig;
    plymouth-start.serviceConfig = commonConfig;
    flatpak-repo.serviceConfig = commonConfig;
    avahi-daemon.serviceConfig = commonConfig;
    "autovt@tty1".serviceConfig = commonConfig;
    "systemd-ask-password-console".serviceConfig = commonConfig;
    "systemd-ask-password-plymouth".serviceConfig = commonConfig;
    "systemd-ask-password-wall".serviceConfig = commonConfig;
    thermald.serviceConfig = commonConfig;
    auditd.serviceConfig = commonConfig;
    # cups.serviceConfig = commonConfig;
    # cups-browsed.serviceConfig = commonConfig;
    # NetworkManager.serviceConfig = commonConfig;
    # NetworkManager-dispatcher.serviceConfig = commonConfig;
  };
}
