{ self, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix
    ./wc/niri.nix

    (self + "/system/Apollo/networking.nix")
    (self + "/system/Apollo/hardware-configuration.nix")

    (self + "/modules/nixos/programs/fish.nix")
    (self + "/modules/nixos/programs/dconf.nix")
    (self + "/modules/nixos/programs/gpu-screen-recorder.nix")
    (self + "/modules/nixos/programs/firefox.nix")
    (self + "/modules/nixos/programs/steam.nix")
    (self + "/modules/nixos/programs/gamescope.nix")

    (self + "/modules/nixos/system/security/polkit.nix")
    (self + "/modules/nixos/system/default.nix")
    (self + "/modules/nixos/system/nix.nix")
    (self + "/modules/nixos/system/environment/sessionVariables.nix")
    (self + "/modules/nixos/system/services/flatpak.nix")
    (self + "/modules/nixos/system/services/gvfs.nix")
    (self + "/modules/nixos/system/services/pipewire.nix")
    (self + "/modules/nixos/system/services/udev.nix")
    (self + "/modules/nixos/system/services/displayManager/sddm-astronaut.nix")
    (self + "/modules/nixos/system/services/hardware/openrgb.nix")
    (self + "/modules/nixos/system/services/xserver/amdgpu.nix")
    (self + "/modules/nixos/system/services/xserver/xkb.nix")
    (self + "/modules/nixos/system/hardware/bluetooth.nix")
    (self + "/modules/nixos/system/hardware/cpu.nix")
    (self + "/modules/nixos/system/hardware/enableAllFirmware.nix")
    (self + "/modules/nixos/system/hardware/graphics.nix")

    (self + "/modules/nixos/system/nixpkgs/overlays/default.nix")
  ];

  system.stateVersion = "26.05";
}
