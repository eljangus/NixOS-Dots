{ importTree, ... }:

{
  imports = [
    ../common-programs
  ] ++ importTree ./.;
}
