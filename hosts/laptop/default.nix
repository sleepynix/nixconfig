{ config, lib, pkgs, pkgs-unstable, laptop, ... }:

{
  /* ---- NixOS SYSTEM CONFIG ---- */
  networking.hostName = "${laptop}";
  imports =
  let
    desktop = "gnome";
    gpu = "intel";
  in [
    ./hardware-configuration.nix
    ./boot.nix
    ../../common/system/gpu/${gpu}
    ../../common/system/security.nix
    ../../common/system/nix-settings.nix
    ../../common/system/system-maintenance.nix
    ../../common/system/users.nix
    ../../common/system/printing.nix
    ../../common/system/bluetooth.nix
    ../../common/system/sound.nix
    ../../common/system/locale.nix
    ../../common/system/networking.nix
    ../../common/system/fprintd.nix
    ../../common/system/battery.nix
    ../../common/desktops/${desktop}
    ../../common/desktops/fonts.nix
    ../../common/apps/system-apps.nix
    ../../common/apps/firefox.nix
  ];
  
  /* ---- UNFREE SOFTWARE ---- */
  # Allow any unfree software from pkgs:
  # nixpkgs.config.allowUnfree = true;
  # OR
  # Allow only selected unfree software from pkgs:
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "1password"
    "steam"
    "steam-original"
    "steam-run"
    "geogebra"
    "spotify"
    "libfprint-2-tod1-goodix"
  ];
 
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
