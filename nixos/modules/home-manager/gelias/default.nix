{ importTree, ... }:

{
  imports = [
    ../common-programs/default.nix
  ] ++ importTree ./.;
}
