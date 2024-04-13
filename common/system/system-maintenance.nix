{ config, lib, pkgs, inputs, ... }:

{
  /* ---- SYSTEM MAINTENANCE ---- */
  # Automatic Upgrades
  system.autoUpgrade = {
    enable = true;
    operation = "boot"; # auto updates apply on reboot
    flake = inputs.self.outPath; # formerly "/home/florian/nixconfig"
    flags = [
      "--update-input"
      "nixpkgs"
      "--recreate-lock-file"
      "--print-build-logs"
    ];
    allowReboot = false;
    rebootWindow = {
      lower = "17:00";
      upper = "18:00";
    };
    dates = "17:00";
    randomizedDelaySec = "15min";
  };
  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };
  # Firmware Update Service
  services = {
    fwupd.enable = true;
  };
  # Periodic SSD TRIM
  services.fstrim = {
    enable = lib.mkDefault true;
    interval = "weekly";
  };
}
