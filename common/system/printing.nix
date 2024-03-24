{ config, pkgs, ... }:

{
  /* ---- PRINTING ---- */
  services = {
    printing = {
      enable = true; # enable CUPS
      drivers = [ pkgs.brlaser ];
    };
    avahi = {
      enable = true;
      nssmdns = true; # enable the mDNS NSS plug-in
      openFirewall = true; # open the firewall for UDP port 5353
    };
  };
}
