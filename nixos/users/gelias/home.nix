{self, ...}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.gelias = import (self + "/modules/home-manager/gelias");
  };
}
