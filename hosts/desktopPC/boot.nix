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
  boot.initrd.luks.devices."luks-d021c2aa-620f-4cae-a99b-c2ce28f1c602".device = "/dev/disk/by-uuid/d021c2aa-620f-4cae-a99b-c2ce28f1c602"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-b94c233d-7804-4f23-95f9-c86c7c36df26".device = "/dev/disk/by-uuid/b94c233d-7804-4f23-95f9-c86c7c36df26"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
