{
  description = "NixOS flake with home-manager and support for multiple users and DEs/WCs";
  outputs =
    args@{ self, ... }:
    let
      inputs = (import ./.tack) {
        overrides = args.tackOverrides or { };
      };
    in
    {
      nixosConfigurations =
        let
          importTree = import ./lib/import-tree.nix { inherit (inputs.nixpkgs) lib; };
          mkSystem =
            hostname:
            {
              system ? "x86_64-linux",
            }:
            inputs.nixpkgs.lib.nixosSystem {
              system = system;
              specialArgs = { inherit inputs self importTree; };
              modules = [
                ./hosts/${hostname}
                ./modules/nixos
                inputs.home-manager.nixosModules.home-manager
                {
                  home-manager.extraSpecialArgs = { inherit self importTree; };
                }
              ];
            };
        in
        {
          wc = mkSystem "wc" { };
          gnome = mkSystem "gnome" { };
          kde = mkSystem "kde" { };
        };
    };
}
