{ config, pkgs, inputs, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix
    ../../system/Apollo/networking.nix
    ../../system/Apollo/hardware-configuration.nix
    ../../modules/nixos/system/boot.nix
    ../../modules/nixos/programs/fish.nix
    ../../modules/nixos/programs/dconf.nix
    ../../modules/nixos/programs/firefox.nix
    ../../modules/nixos/programs/steam.nix
    ../../modules/nixos/programs/gamescope.nix
    ../../modules/nixos/system/services/flatpak.nix
    ../../modules/nixos/system/services/hardware/openrgb.nix
    ../../modules/nixos/system/services/displayManager/gdm.nix
    ../../modules/nixos/system/services/desktopManager/gnome.nix
    ../../modules/nixos/system/default.nix
    ../../modules/nixos/system/nixpkgs/config.nix
  ];

  system.stateVersion = "26.05";
}
