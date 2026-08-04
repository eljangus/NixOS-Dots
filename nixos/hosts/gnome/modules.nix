{ ... }:

{
  myModules = {
    desktop = "gnome";
    programs = {
      base.enable = true; # base programs, on by default
    };
    system = {
      base.enable = true; # base system, on by default
      openrgb.enable = true;
      udev.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
