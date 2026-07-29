{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myModules.programs.gpu-screen-recorder.enable {
    programs.gpu-screen-recorder.enable = true;
  };
}
