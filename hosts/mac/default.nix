{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (import (self + "/lib/mk-user.nix") {
        name = "melias";
        host = "mac";
      })
    ]
    ++ importTree ./.;
}
