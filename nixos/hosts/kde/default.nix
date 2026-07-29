{ self, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix

    (self + "/system/Apollo/default.nix")
    (self + "/system/Apollo/networking.nix")
    (self + "/system/Apollo/hardware-configuration.nix")

    (self + "/modules/nixos/programs/default.nix")
    (self + "/modules/nixos/programs/steam.nix")
    (self + "/modules/nixos/programs/dconf.nix")

    (self + "/modules/nixos/system/default.nix")
    (self + "/modules/nixos/system/services/displayManager/sddm.nix")
    (self + "/modules/nixos/system/services/desktopManager/plasma6.nix")
  ];

  system.stateVersion = "26.05";
}
