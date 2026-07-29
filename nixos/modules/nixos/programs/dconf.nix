{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.myModules.programs.dconf.enable {
    programs.dconf.enable = true;
  };
}
