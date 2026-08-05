{
  description = "NixOS and nix-darwin flake with home-manager, multiple users and DEs/WCs";

  outputs = args @ {self, ...}: let
    inputs = import ./.tack {
      overrides = args.tackOverrides or {};
    };
    inherit (inputs.nixpkgs) lib;
    importTree = import ./lib/import-tree.nix {inherit lib;};
    specialArgs = {inherit inputs self importTree;};
    commonModules = [
      ./modules/common
      {home-manager.extraSpecialArgs = {inherit self importTree;};}
    ];
    mkSystem = hostname: system:
      lib.nixosSystem {
        inherit specialArgs;
        modules =
          commonModules
          ++ [
            {nixpkgs.hostPlatform = system;}
            ./hosts/${hostname}
            inputs.home-manager.nixosModules.home-manager
            inputs.nvf.nixosModules.default
          ];
      };
    mkDarwin = hostname: system:
      inputs.nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        modules =
          commonModules
          ++ [
            {nixpkgs.hostPlatform = system;}
            ./hosts/${hostname}
            inputs.home-manager.darwinModules.home-manager
          ];
      };
  in {
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      wc = mkSystem "wc" "x86_64-linux";
      gnome = mkSystem "gnome" "x86_64-linux";
      kde = mkSystem "kde" "x86_64-linux";
    };

    darwinConfigurations = {
      mac = mkDarwin "mac" "aarch64-darwin"; # example for once I get around to setting up nix-darwin, soon to come, not used yet
    };
  };
}
