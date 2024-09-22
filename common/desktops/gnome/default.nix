{ config, pkgs, pkgs-unstable, ... }:

{
  /* ---- GNOME DESKTOP ---- */
  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "de";
    };
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };
  services.libinput = { # Touchpad support for Laptops
    enable = true;
    touchpad = {
      tappingDragLock = true;
      naturalScrolling = true;
    };
  };
  
  environment.systemPackages = with pkgs; [
    gnome.gnome-software
    evolution
    pdfarranger
    pika-backup
    celluloid
    impression
    apostrophe
    wike
    blanket
    newsflash
    fragments
    gnome-obfuscate
    rhythmbox
    eyedropper
    gnome-frog
    easyeffects
    gnome-podcasts
    warp
    metadata-cleaner
    amberol
    eartag
    collision
    diebahn
    parabolic
    paper-clip
    switcheroo
    gnome.simple-scan
    gnome.file-roller
    gnome.gnome-tweaks
    resources
    gnome.gnome-boxes
    gnome.gnome-sound-recorder
    gnome-photos
    gnome.dconf-editor
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    # planify
  ] ++ (with pkgs-unstable; [
    # add packages from nixpkgs-unstable
  ]);

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome.cheese
    gnome.gnome-music
  ];
}
