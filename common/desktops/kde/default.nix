{
  config,
  pkgs,
  ...
}:

{
  # ---- KDE PLASMA ----
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
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


  # ---- KDE specific applications ----
  environment.systemPackages =
    with pkgs;
    [
      # add packages from nixpkgs-stable
    ]
    ++ (with pkgs-unstable; [
      # add packages from nixpkgs-unstable
    ]);

  programs = {
    # add KDE specific programs
  };
}
