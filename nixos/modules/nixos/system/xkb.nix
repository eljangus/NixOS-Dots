{ config, lib, ... }:

{
  config = lib.mkIf config.myModules.system.xkb.enable {
    services.xserver.xkb = {
      layout = "de";
      variant = "";
    };
  };
}
