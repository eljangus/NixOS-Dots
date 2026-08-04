{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (self + "/systems/Apollo")
      (self + "/users/kdelias")
    ]
    ++ importTree ./.;
}
