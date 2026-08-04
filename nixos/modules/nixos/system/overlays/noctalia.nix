{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  config = lib.mkIf config.myModules.system.overlays.noctalia.enable {
    nixpkgs.overlays = [
      (final: prev: {
        noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
    ];
  };
}
