{ lib, config, ... }:

let
  cfg = config.myModules.programs;

  baseProgramNames = [ "fish" "starship" "vim" ];
in
{
  options.myModules = {
    programs = builtins.listToAttrs (
      map (name: {
        inherit name;
        value.enable = lib.mkOption {
          type = lib.types.bool;
          default = cfg.base.enable;
        };
      }) baseProgramNames
    ) // {
      base.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables fish, starship, vim";
      };
    };
  };
}
