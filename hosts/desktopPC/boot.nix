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
  boot.initrd.luks.devices."luks-8e129a36-a60c-4c22-ad28-613c740c2d11".device = "/dev/disk/by-uuid/8e129a36-a60c-4c22-ad28-613c740c2d11"; # root (from hardware-configuration.nix)
  boot.initrd.luks.devices."luks-67cf7816-bfa3-446f-add3-7df5d7bdf2fa".device = "/dev/disk/by-uuid/67cf7816-bfa3-446f-add3-7df5d7bdf2fa"; # swap (from configuration.nix)

  # ---- KERNEL VERSION ----
  # If this option isn't set, then the default LTS Kernel is used.
  # To list available kernels, start a nix repl, do ":l <nixpkgs>"
  # and check tab-completion for pkgs.linuxPackages.
  boot.kernelPackages = pkgs.linuxPackages_latest; # choose _latest or specific versions like pkgs.linuxPackages_6_6
}
