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
    desktop = "plasma";
    programs = {
      base.enable = true; # base programs, on by default
    };
    system = {
      openrgb.enable = true;
      udev.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
