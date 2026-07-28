{ ... }:

{
  nixpkgs = {
    overlays = [
      (final: prev: {
        swash = inputs.swash.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
    ];
  };
}
