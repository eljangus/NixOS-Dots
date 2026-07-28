{ ... }:

{
  nixpkgs = {
    overlays = [
      (final: prev: {
        sddm-astronaut = prev.sddm-astronaut.override {
          embeddedTheme = "purple_leaves";
        };
      })
    ];
  };
}
