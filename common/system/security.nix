{
  /* ---- SECURITY ---- */
  security.auditd.enable = true;
  services.sysstat.enable = true;
  boot.extraModprobeConfig = ''
    install tipc /bin/true
    install rds /bin/true
    install sctp /bin/true
    install dccp /bin/true
  '';
}
