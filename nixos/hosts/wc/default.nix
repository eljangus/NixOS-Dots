{ ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix
    ./boot.nix
    ./networking.nix
    ./wc/niri.nix
    ../../system/Apollo/hardware-configuration.nix
    ../../modules/nixos/programs/fish.nix
    ../../modules/nixos/programs/dconf.nix
    ../../modules/nixos/programs/gpu-screen-recorder.nix
    ../../modules/nixos/programs/firefox.nix
    ../../modules/nixos/programs/steam.nix
    ../../modules/nixos/programs/gamescope.nix
    ../../modules/nixos/system/security/polkit.nix
    ../../modules/nixos/system/default.nix
    ../../modules/nixos/system/nix.nix
    ../../modules/nixos/system/environment/sessionVariables.nix
    ../../modules/nixos/system/services/flatpak.nix
    ../../modules/nixos/system/services/gvfs.nix
    ../../modules/nixos/system/services/pipewire.nix
    ../../modules/nixos/system/services/udev.nix
    ../../modules/nixos/system/services/displayManager/sddm-astronaut.nix
    ../../modules/nixos/system/services/hardware/openrgb.nix
    ../../modules/nixos/system/services/xserver/amdgpu.nix
    ../../modules/nixos/system/services/xserver/xkb.nix
    ../../modules/nixos/system/hardware/bluetooth.nix
    ../../modules/nixos/system/hardware/cpu.nix
    ../../modules/nixos/system/hardware/enableAllFirmware.nix
    ../../modules/nixos/system/hardware/graphics.nix
    ../../modules/nixos/system/nixpkgs/overlays/default.nix
    ../../modules/nixos/system/nixpkgs/config.nix
  ];

  system.stateVersion = "26.05";
}
