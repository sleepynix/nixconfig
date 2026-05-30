{
  pkgs,
  pkgs-unstable,
  ...
}:

{
  # ---- USERS ----
  users = {
    defaultUserShell = pkgs.fish;
    # -- Florian -- #
    users.florian = {
      isNormalUser = true;
      description = "Florian";
      # initialPassword = "0000"; # change after first login!
      # useDefaultShell = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages =
        with pkgs;
        [
          signal-desktop
          qalculate-gtk
          geogebra6
          # logseq # build failure because electron-39.8.10 is EOL
          gimp3
          darktable
          mediathekview
          nextcloud-client
        ]
        ++ (with pkgs-unstable; [
          # add packages from nixpkgs-unstable
          spotify
        ]);
    };
  };
}
