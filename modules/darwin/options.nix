{
  config,
  lib,
  ...
}: let
  cfgOverlays = config.myModules.system.overlays;

  enabled = {enable = lib.mkDefault true;};

  overlayNames = [
  ];
in {
  options.myModules = {
    programs = {
      desktop-pkgs.enable = lib.mkEnableOption "enable desktop packages";
    };

    system = {
      homebrew.enable = lib.mkEnableOption "enable homebrew";
      overlays = {
        enable = lib.mkEnableOption "all overlays (master switch)";
      };
    };
  };

  # opt-in, set per host: gamescope, gpu-screen-recorder,
  # openrgb, polkit, udev, overlays
  config.myModules = {
    programs = {
      desktop-pkgs = enabled;
    };

    system =
      {
        homebrew = enabled;
      }
      // {
        overlays = lib.genAttrs overlayNames (_: {
          enable = lib.mkDefault cfgOverlays.enable;
        });
      };
  };
}
