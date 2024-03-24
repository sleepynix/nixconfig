{ config, pkgs, ... }:

{
  /* ---- FONTS ---- */
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      source-sans
      noto-fonts
      ubuntu_font_family
      roboto
      intel-one-mono
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Ubuntu" ];
	sansSerif = [ "Ubuntu" ];
	monospace = [ "Ubuntu" ];
      };
    };
  };
}
