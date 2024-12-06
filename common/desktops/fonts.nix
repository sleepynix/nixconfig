{
  pkgs,
  ...
}:

{
  # ---- FONTS ----
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      source-sans
      noto-fonts
      ubuntu_font_family
      roboto
      intel-one-mono
      inter
      fira
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Inter" ];
        sansSerif = [ "Inter" ];
        monospace = [ "Inter" ];
      };
    };
  };
}
