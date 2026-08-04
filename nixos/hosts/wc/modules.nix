{ ... }:

{
  myModules = {
    desktop = "niri";
    programs = {
      base.enable = true; # base programs, on by default
      gpu-screen-recorder.enable = true;
    };
    system = {
      base.enable = true; # base system, on by default
      overlays.enable = true;
      overlays.noctalia.enable = false;
      openrgb.enable = true;
      udev.enable = true;
      polkit.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
