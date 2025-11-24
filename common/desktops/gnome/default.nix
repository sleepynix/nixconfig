{
  config,
  pkgs,
  pkgs-unstable,
  ...
}:

{
  # ---- GNOME DESKTOP ----
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
  services.libinput = {
    # Touchpad support for Laptops
    enable = true;
    touchpad = {
      tappingDragLock = true;
      naturalScrolling = true;
    };
  };

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

  environment.gnome.excludePackages =
    with pkgs;
    [
      gnome-tour
      cheese
      gnome-music
      gnome-console
    ];
}
