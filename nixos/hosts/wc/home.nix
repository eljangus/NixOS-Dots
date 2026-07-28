{ ... }:

{
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.elias = import ../../../modules/home-manager/elias/default.nix;
  };
}
