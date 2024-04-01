{ config, lib, pkgs, pkgs-unstable, ... }:

{
  /* ---- SYSTEM-WIDE APPLICATIONS ---- */
  environment.systemPackages = with pkgs; [
    gh
    gnupg
    neofetch
    lynis
    ffmpeg
    vlc
    lf
    fzf
    btop
    bat
    cowsay
    lolcat
    distrobox
    libreoffice-fresh
    gnome.gnome-software
    pciutils
    clinfo
    vulkan-tools
    libva-utils
    gpu-viewer
  ] ++ (with pkgs-unstable; [
    # add packages from nixpkgs-unstable
  ]);

  /* ---- PROGRAMS WITH SPECIAL OPTIONS ---- */
  services.flatpak.enable = true;
  programs = {
    git = {
      enable = true;
      config = {
        init = {
	  defaultBranch = "main";
	};
      };
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        set -U fish_greeting # disable greeting
      '';
    };
    kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
        customRC = ''
          set relativenumber
        '';
      };
    };
    dconf.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "florian" ];
      package = pkgs._1password-gui; # or pkgs-unstable
    };
    ausweisapp = {
      enable = true;
      openFirewall = true;
    };
    steam.enable = true;
  };
  # Enable udev rules for Steam hardware such as the Steam Controller 
  hardware.steam-hardware.enable = true;

  /* ---- VIRTUALISATION ---- */
  virtualisation.waydroid.enable = true;
  virtualisation.podman.enable = true;
}
