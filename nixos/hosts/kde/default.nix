{ self, importTree, ... }:

{
  imports = [
    (self + "/systems/Apollo")
  ] ++ importTree ./.;
}
