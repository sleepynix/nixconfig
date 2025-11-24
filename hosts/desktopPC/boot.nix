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
  boot.initrd.luks.devices."luks-3b781a2a-90d3-4442-836b-51cc232e1695".device = "/dev/disk/by-uuid/3b781a2a-90d3-4442-836b-51cc232e1695"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-dce688d7-6360-4343-b3d6-7d7c8cf7f632".device = "/dev/disk/by-uuid/dce688d7-6360-4343-b3d6-7d7c8cf7f632"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  # boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
