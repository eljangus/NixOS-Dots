{...}: {
  system.stateVersion = "26.05";

  myModules = {
    system = {
      openrgb.enable = true;
      udev.enable = true;
    };
  };
}
