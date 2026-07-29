{ self, ... }:

{
  imports = [
    ./home.nix
    ./xdg.nix
    ./programs/fish.nix
    (self + "/modules/home-manager/common-programs/default.nix")
  ];
}
