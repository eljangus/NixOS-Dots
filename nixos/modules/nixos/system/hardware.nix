{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myModules.hardware.enable {
    hardware = {
      bluetooth.enable = true;
      cpu.amd.updateMicrocode = true;
      enableAllFirmware = true;
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
