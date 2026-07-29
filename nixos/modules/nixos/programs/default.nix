{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./nh.nix
    ./firefox.nix
    ./fish.nix
    ./dconf.nix
    ./gamescope.nix
    ./gpu-screen-recorder.nix
    ./steam.nix
  ];
}
