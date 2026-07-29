{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./nh.nix
    ./firefox.nix
    ./fish.nix
  ];
}
