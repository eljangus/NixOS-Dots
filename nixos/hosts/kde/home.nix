{ ... }:

{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.kdelias = import ../../modules/home-manager/kdelias/default.nix;
  };
}
