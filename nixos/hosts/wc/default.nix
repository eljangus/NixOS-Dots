{ self, ... }:

{
  imports = [
    ./user.nix
    ./home.nix
    ./pkgs.nix
    (self + "/system/Apollo/networking.nix")
    (self + "/system/Apollo/hardware-configuration.nix")
    (self + "/modules/nixos")
  ];

 myModules = {
    desktop = "niri";
    noctalia-cachix.enable = true;
    overlays.enable = true;
    programs = {
      base.enable = true; # base programs, on by default
      gpu-screen-recorder.enable = true;
    };
    polkit.enable = true;
    services = {
      openrgb.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
