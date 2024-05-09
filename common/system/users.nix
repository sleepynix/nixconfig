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
        signal-desktop
        qalculate-gtk
        geogebra6
        joplin-desktop
        element-desktop
        drawio
        gimp
        darktable
        mediathekview
        openboard
        spotify
      ] ++ (with pkgs-unstable; [
        # add packages from nixpkgs-unstable
      ]);
    };
  };
}
