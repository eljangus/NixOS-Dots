{ self, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix
    (self + "/system/Apollo/networking.nix")
    (self + "/system/Apollo/hardware-configuration.nix")
  ];

 myModules = {
    desktop = "niri";
    programs = {
      base.enable = true; # base programs, on by default
      gpu-screen-recorder.enable = true;
    };
    system = {
      overlays.enable = true;
      noctalia-cachix.enable = true;
      openrgb.enable = true;
      udev.enable = true;
      polkit.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
