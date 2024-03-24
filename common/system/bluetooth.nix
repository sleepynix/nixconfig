{ config, pkgs, ... }:

{
  /* ---- BLUETOOTH ---- */
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
}
