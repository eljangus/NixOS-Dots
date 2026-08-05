{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (self + "/systems/Apollo")
      (import (self + "/lib/mk-user.nix") {
        name = "gelias";
        host = "gnome";
      })
    ]
    ++ importTree ./.;
}
