{ config, pkgs, ... }:

{
  /* ---- NIX SETTINGS ---- */
  nix.settings = {  
    auto-optimise-store = true;  
    experimental-features = [ "nix-command" "flakes" ];
  };
}
