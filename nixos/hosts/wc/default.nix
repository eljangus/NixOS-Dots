{ self, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix
    ./wc/niri.nix

    (self + "/system/Apollo/default.nix")
    (self + "/system/Apollo/networking.nix")
    (self + "/system/Apollo/hardware-configuration.nix")

    (self + "/modules/nixos/programs/default.nix")
    (self + "/modules/nixos/programs/dconf.nix")
    (self + "/modules/nixos/programs/steam.nix")
    (self + "/modules/nixos/programs/gpu-screen-recorder.nix")

    (self + "/modules/nixos/system/default.nix")
    (self + "/modules/nixos/system/security/polkit.nix")
    (self + "/modules/nixos/system/nix.nix")
    (self + "/modules/nixos/system/services/gvfs.nix")
    (self + "/modules/nixos/system/services/displayManager/sddm-astronaut.nix")

    (self + "/modules/nixos/system/nixpkgs/overlays/default.nix")
  ];

  system.stateVersion = "26.05";
}
