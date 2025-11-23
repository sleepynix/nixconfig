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
  boot.initrd.luks.devices."luks-c969ce41-1187-4ccd-b297-c7274a82a6d6".device = "/dev/disk/by-uuid/c969ce41-1187-4ccd-b297-c7274a82a6d6"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-0ab13855-fe84-485f-ac82-35b674c133b8".device = "/dev/disk/by-uuid/0ab13855-fe84-485f-ac82-35b674c133b8"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  # boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
