{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (self + "/systems/Mac")
      (import (self + "/lib/mk-user.nix") {
        name = "melias";
        host = "mac";
      })
    ]
    ++ importTree ./.;
}
