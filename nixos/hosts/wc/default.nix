{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (self + "/systems/Apollo")
      (import (self + "/lib/mk-user.nix") {
        name = "elias";
        host = "wc";
        hmModules = [(self + "/modules/home-manager/elias")];
      })
    ]
    ++ importTree ./.;
}
