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
      fira-code
      fira-code-symbols
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Inter" ];
        sansSerif = [ "Inter" ];
        monospace = [ "Fira Code" ];
      };
    };
  };
}
