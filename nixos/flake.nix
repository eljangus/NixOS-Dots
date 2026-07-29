{
  description = "NixOS flake with home-manager and support for multiple users and DEs/WCs";
  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";
    swash = {
      url = "github:ItsLemmy/swash";
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
      importTree = import ./lib/import-tree.nix { inherit (nixpkgs) lib; };
      mkSystem = hostname:
      {
        system ? "x86_64-linux",
      }:
      nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = { inherit inputs self importTree; };
        modules = [
          ./hosts/${hostname}/default.nix
          ./modules/nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = { inherit self importTree; };
          }
        ];
      };
      in {
        wc = mkSystem "wc" { };
        gnome = mkSystem "gnome" { };
        kde = mkSystem "kde" { };
      };
  };
}
