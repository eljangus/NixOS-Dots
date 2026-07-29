{ lib, ... }:

{
  options.myModules.overlays = {
    enable = lib.mkEnableOption "all overlays (master switch)";

    niri.enable = lib.mkEnableOption "niri overlay";
    noctalia.enable = lib.mkEnableOption "noctalia overlay";
    qt6ct-kde.enable = lib.mkEnableOption "qt6ct-kde overlay";
    sddm-astronaut.enable = lib.mkEnableOption "sddm-astronaut overlay";
    swash.enable = lib.mkEnableOption "swash overlay";
  };
}
