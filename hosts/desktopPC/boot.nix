{
  pkgs,
  ...
}:

{
  # ---- BOOT ----
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  /* boot.plymouth = { # boot splash screen
    enable = true;
  }; */
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.initrd.luks.devices."luks-7489ddc8-8e40-4c56-8092-4823fffd011a".device = "/dev/disk/by-uuid/7489ddc8-8e40-4c56-8092-4823fffd011a"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-4b3150ea-f1cf-46bd-8853-c99585e5ed52".device = "/dev/disk/by-uuid/4b3150ea-f1cf-46bd-8853-c99585e5ed52"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  # boot.kernelPackages = pkgs.linuxPackages_6_18; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
