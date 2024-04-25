{ config, pkgs, ... }:

{
  /* ---- NETWORKING ---- */
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
    # firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764;} ]; # for Gsconnect
    # firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764;} ]; # for Gsconnect
    # (The module "programs.kdeconnect" opens the required ports automatically.)
  };

  services = {
    openssh = { # allow remote login via ssh
      enable = true;
      openFirewall = true;
      settings = {
        PermitRootLogin = "no";
        AllowAgentForwarding = "no";
        TCPKeepAlive = "no";
        MaxSessions = "2";
        MaxAuthTries = "3";
        LogLevel = "VERBOSE";
        ClientAliveCountMax = "2";
        AllowTcpForwarding = "no";
        AllowUsers = [ "florian" ];
      };
    };
  };
}
