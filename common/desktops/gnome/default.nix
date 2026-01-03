{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  # ---- GNOME DESKTOP ----
  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "de";
      };
    };
    libinput = { # Touchpad support for Laptops
      enable = true;
      touchpad = {
        tappingDragLock = true;
        naturalScrolling = true;
      };
    };
  };

  # ---- GNOME specific applications ----
  environment.systemPackages =
    with pkgs;
    [
      ptyxis
      gnome-software
      pods
      evolution
      pdfarranger
      pika-backup
      celluloid
      apostrophe
      papers
      wike
      blanket
      newsflash
      fragments
      rhythmbox
      gnome-frog
      easyeffects
      warp
      metadata-cleaner
      amberol
      eartag
      collision
      parabolic
      switcheroo
      simple-scan
      file-roller
      gnome-tweaks
      refine
      resources
      gnome-boxes
      gnome-sound-recorder
      gnome-photos
      gnome-decoder
      dconf-editor
      gnomeExtensions.caffeine
      gnomeExtensions.blur-my-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.paperwm
      gnomeExtensions.tiling-shell
      # planify
    ]
    ++ (with pkgs-unstable; [
      # add packages from nixpkgs-unstable
    ]);

  programs = {
    dconf.enable = true;
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
  };

  environment.gnome.excludePackages =
    with pkgs;
    [
      gnome-tour
      cheese
      gnome-music
      gnome-console
    ];
}
