{ config, lib, ... }:

{
  config = lib.mkIf config.myModules.overlays.niri.enable {
    nixpkgs.overlays = [
      (final: prev: {
        sddm-astronaut = prev.sddm-astronaut.override {
          embeddedTheme = "purple_leaves";
        };
      })
    ];
  };
}
