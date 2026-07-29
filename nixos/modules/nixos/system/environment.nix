{ config, lib, ... }:

{
  config = lib.mkIf config.myModules.system.environment.enable {
    zramSwap.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    console.keyMap = "de";
    documentation.nixos.enable = false;
    services.flatpak.enable = true;
    services.gvfs.enable = true;
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      audio.enable = true;
    };
  };
}
