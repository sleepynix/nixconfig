{ config, pkgs, ... }:

{
  /* ---- BOOT ---- */
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth = {
    enable = true;
  };
  boot.initrd.kernelModules = [ "i915" ];
  boot.initrd.luks.devices."luks-d1e14785-ad63-4e57-af8a-1d05503cbac0".device = "/dev/disk/by-uuid/d1e14785-ad63-4e57-af8a-1d05503cbac0"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-acfbf4fe-7ea9-4633-a3c5-7b49ec1233ce".device = "/dev/disk/by-uuid/acfbf4fe-7ea9-4633-a3c5-7b49ec1233ce"; # swap (from configuration.nix)

  /* ---- KERNEL VERSION ---- */
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
  
  /* ---- MUTE KEY ---- */
  # Workaround to turn off indicator light
  systemd.services.configure-sound-leds = rec {
    wantedBy = [ "sound.target" ];
    after = wantedBy;
    serviceConfig.Type = "oneshot";
    script = ''
      echo 'off' > /sys/class/sound/ctl-led/mic/mode
    '';
  };
  
}
