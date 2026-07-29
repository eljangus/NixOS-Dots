{ self, ... }:

{
  imports = [
    ./home.nix
    ./programs/fish.nix
    (self + "/modules/home-manager/common-programs/default.nix")
  ];
}
