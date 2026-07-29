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
    system = {
      polkit.enable = lib.mkEnableOption "polkit wrapper for noctalia";
      noctalia-cachix.enable = lib.mkEnableOption "enable noctalia's cachix stuff";
      openrgb.enable = lib.mkEnableOption "OpenRGB";
      udev.enable = lib.mkEnableOption "udev rules";
      base-services.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables gvfs, flatpak and pipewire";
      };
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
      overlays = {
        enable = lib.mkEnableOption "all overlays (master switch)";
        niri.enable = lib.mkEnableOption "niri overlay";
        noctalia.enable = lib.mkEnableOption "noctalia overlay";
        qt6ct-kde.enable = lib.mkEnableOption "qt6ct-kde overlay";
        sddm-astronaut.enable = lib.mkEnableOption "sddm-astronaut overlay";
        swash.enable = lib.mkEnableOption "swash overlay";
      };
    };
    desktop = lib.mkOption {
      type = lib.types.nullOr (lib.types.enum [ "gnome" "plasma" "hyprland" "niri" ]);
      default = null;
      description = "Which desktop/window manager this host runs";
    };
  };
}
