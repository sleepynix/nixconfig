{ config, pkgs, ... }:

{
  /* ---- KDE PLASMA ---- */
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma5.enable = true;
    libinput = { # Touchpad support for Laptops
      enable = true;
      touchpad = {
        tappingDragLock = true;
        naturalScrolling = true;
      };
    };
  };
}
