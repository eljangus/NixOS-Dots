{ config, ... }:

{
  imports = [
    ./home.nix
    ./programs/default.nix
  ];
}
