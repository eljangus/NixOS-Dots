{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (self + "/systems/Apollo")
      (import (self + "/lib/mk-user.nix") {
        name = "kdelias";
        host = "kde";
      })
    ]
    ++ importTree ./.;
}
