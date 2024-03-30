{ config, lib, pkgs, pkgs-unstable, ... }:

{
  /* ---- USERS ---- */
  users = {
    defaultUserShell = pkgs.fish;
    # -- Florian -- #
    users.florian = {
      isNormalUser = true;
      description = "Florian";
      # initialPassword = "0000"; # change after first login!
      # useDefaultShell = true;
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        evolution
        signal-desktop
        qalculate-gtk
        geogebra6
        texlive.combined.scheme-small
        setzer
        joplin-desktop
        wike
        blanket
        newsflash
        element-desktop
        fragments
        gnome-obfuscate
        drawio
        rhythmbox
        eyedropper
        gimp
        darktable
        gnome-frog
        easyeffects
        gnome-podcasts
        mediathekview
        warp
        metadata-cleaner
        openboard
        amberol
        eartag
        collision
        diebahn
        spotify
        # planify
      ] ++ (with pkgs-unstable; [
        # add packages from nixpkgs-unstable
	# parabolic
	# paper-clip
	# switcheroo
      ]);
    };
  };
}
