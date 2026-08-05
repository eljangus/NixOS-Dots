{...}: {
  myModules = {
    desktop = "niri";
    programs = {
      gpu-screen-recorder.enable = true;
    };
    system = {
      overlays.enable = true;
      overlays.noctalia.enable = false;
      overlays.glaze.enable = false;
      openrgb.enable = true;
      udev.enable = true;
      polkit.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
