{ config, pkgs, ... }:

{
  /* ---- GPU ACCELERATION ---- */
  hardware.opengl = {
    driSupport = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
    ];
  };
}
