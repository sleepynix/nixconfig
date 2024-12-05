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
    ptyxis
    gnome-software
    pods
    evolution
    pdfarranger
    pika-backup
    celluloid
    impression
    apostrophe
    wike
    blanket
    newsflash
    mousam
    fragments
    gnome-obfuscate
    rhythmbox
    eyedropper
    gnome-frog
    memorado
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
    simple-scan
    file-roller
    gnome-tweaks
    resources
    gnome-boxes
    gnome-sound-recorder
    gnome-photos
    dconf-editor
    gnomeExtensions.caffeine
    gnomeExtensions.blur-my-shell
    # planify
  ] ++ (with pkgs-unstable; [
    # add packages from nixpkgs-unstable
  ]);

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    cheese
    gnome-music
    gnome-console
  ];
}
