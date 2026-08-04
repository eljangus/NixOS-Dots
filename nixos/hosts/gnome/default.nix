{ self, importTree, ... }:

{
  imports = [
    (self + "/systems/Apollo")
    (self + "/users/gelias")
  ]
  ++ importTree ./.;
}
