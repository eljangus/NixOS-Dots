{
  description = "NixOS flake with home-manager and support for multiple users and DEs/WCs";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    waytator = {
      url = "github:ItsLemmy/waytator";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };
  outputs = inputs @ { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations =
      let
      mkSystem = hostname:
      {
        system ? "x86_64-linux",
      }:
      nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/hosts/${hostname}.nix
          home-manager.nixosModules.home-manager
        ];
      };
      in {
        wc-btw = mkSystem "wc-btw" { };
        gnome-btw = mkSystem "gnome-btw" { };
        kde-btw = mkSystem "kde-btw" { };
      };
  };
}
