{ config, pkgs, ... }:

{
  /* ---- GPU ACCELERATION ---- */
  # see https://nixos.org/manual/nixos/stable/index.html#sec-gpu-accel
  hardware.graphics = {
    enable = true;
    # driSupport = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };
}
