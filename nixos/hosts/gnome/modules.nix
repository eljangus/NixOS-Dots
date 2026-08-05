{...}: {
  myModules = {
    desktop = "gnome";
    system = {
      openrgb.enable = true;
      udev.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
