{ config, pkgs, ... }:

{
  /* ---- GPU ACCELERATION ---- */
  # see https://nixos.org/manual/nixos/stable/index.html#sec-gpu-accel
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
    ];
  };
}
