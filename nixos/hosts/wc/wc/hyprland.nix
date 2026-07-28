{ ... }:

{
  imports = [
    ./pkgs/hyprland-pkgs.nix
    ../../../modules/nixos/programs/hyprland.nix
    ../../../modules/nixos/system/xdg/portals-hyprland.nix
    ../../../modules/nixos/system/services/displayManager/defaultSession-hyprland.nix
  ];
}
