{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.myModules.system.hardware.enable {
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
