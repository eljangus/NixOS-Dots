{ config, lib, ... }:

let
  cfg = config.myModules.overlays;
  overlayNames = [ "niri" "noctalia" "qt6ct-kde" "sddm-astronaut" "swash" ];
in
{
  imports = [
    ./options.nix
    ./niri.nix
    ./noctalia.nix
    ./qt6ct-kde.nix
    ./sddm-astronaut.nix
    ./swash.nix
  ];

  config = lib.mkIf cfg.enable {
    myModules.overlays = lib.genAttrs overlayNames (name: {
      enable = lib.mkDefault true;
    });
  };
}
