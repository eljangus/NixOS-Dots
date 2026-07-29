{ config, lib, inputs, pkgs, ... }:

{
  config = lib.mkIf config.myModules.overlays.noctalia.enable {
    nixpkgs.overlays = [
      (final: prev: {
        noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
    ];
  };
}
