{ config, lib, ... }:

{
  config = lib.mkIf config.myModules.polkit.enable {
    security.polkit = {
      enable = true;
      enablePkexecWrapper = true;
    };
  };
}
