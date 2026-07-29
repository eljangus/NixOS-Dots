{ lib, ... }:

{
  options.myModules = {
    programs = {
      base.enable = lib.mkEnableOption "enables firefox, steam, fish, dconf, git, nh";

      firefox.enable = lib.mkEnableOption "Firefox";
      steam.enable = lib.mkEnableOption "Steam";
      gamescope.enable = lib.mkEnableOption "Gamescope";
      fish.enable = lib.mkEnableOption "Fish shell";
      dconf.enable = lib.mkEnableOption "dconf";
      git.enable = lib.mkEnableOption "Git";
      nh.enable = lib.mkEnableOption "nh";
      gpu-screen-recorder.enable = lib.mkEnableOption "GPU Screen Recorder";
    };

    polkit.enable = lib.mkEnableOption "polkit wrapper for noctalia";

    base-services.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "enables gvfs, flatpak and pipewire";
    };

    udev.enable = lib.mkEnableOption "enable udev rules";

    amdgpu.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "whether to enable amdgpu by default";
    };

    hardware.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "whether to enable common hardware configuration (e.g bluetooth, pipewire)";
    };

    noctalia-cachix.enable = lib.mkEnableOption "enable noctalia's cachix stuff";

    desktop = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum [ "gnome" "plasma" "hyprland" "niri" ]);
      default = null;
      description = "Which desktop/window manager this host runs";
    };

    services = {
      openrgb.enable = lib.mkEnableOption "OpenRGB";
    };
  };
}
