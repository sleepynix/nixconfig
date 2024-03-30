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
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.initrd.luks.devices."luks-9cb8ef08-b641-471d-b0eb-ec1924e778be".device = "/dev/disk/by-uuid/9cb8ef08-b641-471d-b0eb-ec1924e778be"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-cc2e6027-4989-4f6e-940c-29e6ac83834a".device = "/dev/disk/by-uuid/cc2e6027-4989-4f6e-940c-29e6ac83834a"; # swap (from configuration.nix)

  /* ---- KERNEL VERSION ---- */
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  boot.kernelPackages = pkgs.linuxPackages_6_6; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
