{
  description = "NixOS System Flake";
  
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, auto-cpufreq, ... }:
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
        specialArgs = { inherit pkgs-unstable laptop inputs; };
        modules = [
          ./hosts/laptop
          auto-cpufreq.nixosModules.default
        ];
      };
      
      "${desktopPC}" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit pkgs-unstable desktopPC inputs; };
        modules = [
          ./hosts/desktopPC
        ];
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    /* auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    }; */
  };
}
