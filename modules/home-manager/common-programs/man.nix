{
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    programs.man.generateCaches = false;
  };
}
