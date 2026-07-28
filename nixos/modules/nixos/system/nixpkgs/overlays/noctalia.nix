{ ... }:

{
  nixpkgs = {
    overlays = [
      (final: prev: {
        noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
    ];
  };
}
