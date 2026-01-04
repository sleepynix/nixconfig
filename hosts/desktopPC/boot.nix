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
  boot.initrd.luks.devices."luks-7a3f1fbf-6c7b-4085-a945-b82ef3b5c649".device = "/dev/disk/by-uuid/7a3f1fbf-6c7b-4085-a945-b82ef3b5c649"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-e29fce76-95e4-41f3-a349-77d2f0f04e83".device = "/dev/disk/by-uuid/e29fce76-95e4-41f3-a349-77d2f0f04e83"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
