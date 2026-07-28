{ ... }:

{
  nixpkgs = {
    overlays = [
      (final: prev: {
        qt6ct-kde = prev.kdePackages.qt6ct.overrideAttrs (old: {
          patches = (old.patches or []) ++ [ ../../../../../patches/qt6ct-shenanigans.patch ];
          nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
            prev.kdePackages.kconfig
            prev.kdePackages.kcolorscheme
            prev.kdePackages.kiconthemes
          ];
        });
      })
    ];
  };
}
