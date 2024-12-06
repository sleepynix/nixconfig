{
  config,
  pkgs,
  ...
}:

{
  # ---- KDE PLASMA ----
  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "de";
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
  services.desktopManager.plasma6.enable = true;
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
      # add packages from nixpkgs-stable
    ]
    ++ (with pkgs-unstable; [
      # add packages from nixpkgs-unstable
    ]);
}
