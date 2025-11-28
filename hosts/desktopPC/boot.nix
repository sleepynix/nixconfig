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
  boot.initrd.luks.devices."luks-f3b88321-c5d2-4f00-b3c3-a65e04e7e4c0".device = "/dev/disk/by-uuid/f3b88321-c5d2-4f00-b3c3-a65e04e7e4c0"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-02da018e-5ae7-4854-9b29-a6c21e70faf7".device = "/dev/disk/by-uuid/02da018e-5ae7-4854-9b29-a6c21e70faf7"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
