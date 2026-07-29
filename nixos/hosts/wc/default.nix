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
      fish.enable = true;
      dconf.enable = true;
      firefox.enable = true;
      steam.enable = true;
      git.enable = true;
      nh.enable = true;
      gpu-screen-recorder.enable = true;
    };
    polkit.enable = true;
    base-services.enable = true;
    services = {
      openrgb.enable = true;
    };
  };

  system.stateVersion = "26.05";
}
