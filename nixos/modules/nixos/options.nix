{ config, lib, ... }:

let
  cfgPrograms = config.myModules.programs;
  cfgSystem = config.myModules.system;
  cfgOverlays = config.myModules.system.overlays;

  baseProgramNames = [ "fish" "dconf" "firefox" "steam" "git" "nh" "common-pkgs" "tack" ];
  baseSystemNames = [ "fonts" "environment" "time" "nix" "xkb" "boot" ];
  overlayNames = [ "noctalia" "qt6ct-kde" "sddm-astronaut" "swash" ];
in
{
  options.myModules = {
    programs = {
      firefox.enable = lib.mkEnableOption "Firefox";
      tack.enable = lib.mkEnableOption "tack";
      steam.enable = lib.mkEnableOption "Steam";
      gamescope.enable = lib.mkEnableOption "Gamescope";
      fish.enable = lib.mkEnableOption "Fish shell";
      dconf.enable = lib.mkEnableOption "dconf";
      git.enable = lib.mkEnableOption "Git";
      nh.enable = lib.mkEnableOption "nh";
      common-pkgs.enable = lib.mkEnableOption "common pkgs";
      gpu-screen-recorder.enable = lib.mkEnableOption "GPU Screen Recorder";
      base.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables firefox, steam, fish, dconf, git, nh";
      };
    };
    system = {
      polkit.enable = lib.mkEnableOption "polkit wrapper for noctalia";
      noctalia-cachix.enable = lib.mkEnableOption "enable noctalia's cachix stuff";
      openrgb.enable = lib.mkEnableOption "OpenRGB";
      udev.enable = lib.mkEnableOption "udev rules";
      time.enable = lib.mkEnableOption "timezone settings";
      nix.enable = lib.mkEnableOption "nix settings and configuration, such as enabling flakes and allowing unfree packages";
      environment.enable = lib.mkEnableOption "general environment stuff I want enabled";
      fonts.enable = lib.mkEnableOption "fonts";
      xkb.enable = lib.mkEnableOption "xkb to de";
      boot.enable = lib.mkEnableOption "enable boot stuff";
      base.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "enables gvfs, flatpak and pipewire, such as base environment stuff I always want enabled";
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

  config = lib.mkMerge [
    (lib.mkIf cfgPrograms.base.enable {
      myModules.programs = lib.genAttrs baseProgramNames (name: {
        enable = lib.mkDefault true;
      });
    })
    (lib.mkIf cfgSystem.base.enable {
      myModules.system = lib.genAttrs baseSystemNames (name: {
        enable = lib.mkDefault true;
      });
    })
    (lib.mkIf cfgOverlays.enable {
      myModules.system.overlays = lib.genAttrs overlayNames (name: {
        enable = lib.mkDefault true;
      });
    })
  ];
}
