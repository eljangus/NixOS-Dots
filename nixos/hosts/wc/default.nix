{
  self,
  importTree,
  ...
}: {
  imports =
    [
      (self + "/systems/Apollo")
      (self + "/users/elias")
    ]
    ++ importTree ./.;
}
