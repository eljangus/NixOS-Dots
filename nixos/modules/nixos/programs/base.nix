{ config, lib, ... }:

let
  cfg = config.myModules.programs;
  baseProgramNames = [ "fish" "dconf" "firefox" "steam" "git" "nh" ];
in
{
  config = lib.mkIf cfg.base.enable {
    myModules.programs = lib.genAttrs baseProgramNames (name: {
      enable = lib.mkDefault true;
    });
  };
}
