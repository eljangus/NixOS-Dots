{ config, pkgs, inputs, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix

    (self + "/system/Apollo/networking.nix")
    (self + "/system/Apollo/hardware-configuration.nix")

    (self + "/modules/nixos/programs/fish.nix")
    (self + "/modules/nixos/programs/dconf.nix")
    (self + "/modules/nixos/programs/firefox.nix")
    (self + "/modules/nixos/programs/steam.nix")
    (self + "/modules/nixos/programs/gamescope.nix")

    (self + "/modules/nixos/system/services/flatpak.nix")
    (self + "/modules/nixos/system/services/hardware/openrgb.nix")
    (self + "/modules/nixos/system/services/displayManager/gdm.nix")
    (self + "/modules/nixos/system/services/desktopManager/gnome.nix")

    (self + "/modules/nixos/system/default.nix")
  ];

  system.stateVersion = "26.05";
}
