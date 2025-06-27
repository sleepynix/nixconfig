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
      "--update-input"
      "nixpkgs"
      "--print-build-logs"
    ];
    allowReboot = false;
    rebootWindow = {
      lower = "17:00";
      upper = "18:00";
    };
    dates = "16:30";
    # randomizedDelaySec = "15min";
  };
  # Automatic Garbage Collection
  nix = {
    gc = {
      automatic = true;
      dates = "16:25";
      options = "--delete-older-than 4d";
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
