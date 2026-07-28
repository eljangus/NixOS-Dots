{ ... }:

{
  imports = [
    ./pkgs/niri-pkgs.nix
    ../../../modules/nixos/programs/niri.nix
    ../../../modules/nixos/system/xdg/portals-niri.nix
    ../../../modules/nixos/system/services/displayManager/defaultSession-niri.nix
  ];
}
