{
  description = "NixOS System Flake";

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixvim,
      ...
    }:
    let
      # ---- PKGS ----
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};

      # ---- COMPUTER NAMES ----
      laptop = "Moon-Presence";
      desktopPC = "Oceiros";
    in
    {

      nixosConfigurations = {
        "${laptop}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable laptop inputs; };
          modules = [
            ./hosts/laptop
            inputs.nixvim.nixosModules.nixvim
          ];
        };

        "${desktopPC}" = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable desktopPC inputs; };
          modules = [
            ./hosts/desktopPC
            inputs.nixvim.nixosModules.nixvim
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:numtide/nixpkgs-unfree?ref=nixos-unstable"; # alternative to "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
