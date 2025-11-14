{
  lib,
  inputs,
  ...
}:

{
  # ---- SYSTEM MAINTENANCE ----
  # Automatic Upgrades
  system.autoUpgrade = {
    enable = true;
    operation = "boot"; # auto updates apply on reboot
    flake = inputs.self.outPath;
    flags = [
      "--update-input" "nixpkgs"
      "--update-input" "nixpkgs-unstable"
      "--update-input" "nixvim"
      "--print-build-logs"
      "--recreate-lock-file"
    ];
    allowReboot = false;
    rebootWindow = {
      lower = "17:00";
      upper = "18:00";
    };
    dates = "Friday 16:30";
    # randomizedDelaySec = "15min";
  };
  # Automatic Garbage Collection
  nix = {
    gc = {
      automatic = true;
      dates = "Friday 16:25";
      options = "--delete-older-than 6d";
    };
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
