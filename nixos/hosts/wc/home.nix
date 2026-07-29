{ self, ... }:

{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.elias = import (self + "/modules/home-manager/elias/default.nix");
  };
}
