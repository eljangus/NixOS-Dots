{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  config = lib.mkIf config.myModules.system.overlays.swash.enable {
    nixpkgs.overlays = [
      (final: prev: {
        swash = inputs.swash.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
    ];
  };
}
