{ config, lib, ... }:

let
  cfg = config.myModules.system.overlays;
  overlayNames = [ "niri" "noctalia" "qt6ct-kde" "sddm-astronaut" "swash" ];
in
{
  config = lib.mkIf cfg.enable {
    myModules.system.overlays = lib.genAttrs overlayNames (name: {
      enable = lib.mkDefault true;
    });
  };
}
