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
      noctalia-cachix.enable = true;
      openrgb.enable = true;
      udev.enable = true;
      polkit.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
