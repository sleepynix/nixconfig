{
  description = "NixOS System Flake";
  
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ... }:
  let
    /* ---- PKGS ---- */
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    
    /* ---- COMPUTER NAMES ---- */
    laptop = "Moon-Presence";
    desktopPC = "Oceiros";
  in {

    nixosConfigurations = {
      "${laptop}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit pkgs-unstable laptop; };
        modules = [
          ./hosts/laptop
        ];
      };
      
      "${desktopPC}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit pkgs-unstable desktopPC; };
        modules = [
          ./hosts/desktopPC
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
}
