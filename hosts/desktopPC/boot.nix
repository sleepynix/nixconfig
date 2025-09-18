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
  boot.plymouth = {
    enable = true;
  };
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.initrd.luks.devices."luks-2d5ce4c4-88f4-436e-846f-61cdc907ae8a".device = "/dev/disk/by-uuid/2d5ce4c4-88f4-436e-846f-61cdc907ae8a"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-9a291fa6-db17-474d-b7f1-83606ad93f20".device = "/dev/disk/by-uuid/9a291fa6-db17-474d-b7f1-83606ad93f20"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  # boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
