{ config, lib, ... }:

{
  config = lib.mkIf config.myModules.amdgpu.enable {
    services.xserver.videoDrivers = ["amdgpu"];
  };
}
