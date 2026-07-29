{ self, ... }:

{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.kdelias = import (self + "/modules/home-manager/kdelias");
  };
}
