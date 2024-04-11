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
  hardware.printers = {
    ensurePrinters = [
      {
        name = "HL-2270DW";
        description = "Brother HL-2270DW";
        deviceUri = "ipp://192.168.2.107";
        model = "drv:///brlaser.drv/br2270dw.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "HL-2270DW";
  };
}
