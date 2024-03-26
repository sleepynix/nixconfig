{ config, pkgs, ... }:

{
  /* ---- GPU ACCELERATION ---- */
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
    ];
  };
}
