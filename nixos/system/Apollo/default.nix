{ self, ... }:

{
  imports = [
    (self + "/modules/nixos/system/services/pipewire.nix")
    (self + "/modules/nixos/system/services/udev.nix")
    (self + "/modules/nixos/system/services/hardware/openrgb.nix")
    (self + "/modules/nixos/system/services/xserver/amdgpu.nix")
    (self + "/modules/nixos/system/hardware/bluetooth.nix")
    (self + "/modules/nixos/system/hardware/cpu.nix")
    (self + "/modules/nixos/system/hardware/enableAllFirmware.nix")
    (self + "/modules/nixos/system/hardware/graphics.nix")
  ];
}
