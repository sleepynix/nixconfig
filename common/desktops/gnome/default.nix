{ config, pkgs, ... }:

{
  /* ---- GNOME DESKTOP ---- */
  services.xserver = {
    enable = true;
    layout = "de";
    xkbVariant = "";
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
    libinput = { # Touchpad support for Laptops
      enable = true;
      touchpad = {
        tappingDragLock = true;
	naturalScrolling = true;
      };
    };
  };
  
  environment.systemPackages = with pkgs; [
    gnome.gnome-software
    pdfarranger
    pika-backup
    celluloid
    impression
    gnome.file-roller
    gnome.gnome-tweaks
    gnome.gnome-boxes
    gnome.gnome-sound-recorder
    gnome-photos
    gnome.dconf-editor
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome.cheese
    gnome.gnome-music
  ];
}
