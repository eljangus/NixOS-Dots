{ ... }:

{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.gelias = import ../../modules/home-manager/gelias/default.nix;
  };
}
