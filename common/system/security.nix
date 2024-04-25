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
}
