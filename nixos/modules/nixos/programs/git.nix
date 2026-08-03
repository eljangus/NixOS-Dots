{ config, lib, ... }:

{
  config = lib.mkIf config.myModules.programs.git.enable {
    programs.git.enable = true;
  };
}
