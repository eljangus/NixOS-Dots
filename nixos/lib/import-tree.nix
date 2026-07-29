{ lib }:

dir:
let
  inherit (builtins) filter map baseNameOf;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix;

  files = map toString (listFilesRecursive dir);
in
filter (p: hasSuffix ".nix" p && baseNameOf p != "default.nix") files
