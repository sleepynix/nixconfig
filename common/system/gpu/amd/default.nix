{ config, pkgs, ... }:

{
  /* ---- GPU ACCELERATION ---- */
  # see https://nixos.org/manual/nixos/stable/index.html#sec-gpu-accel
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };
}
