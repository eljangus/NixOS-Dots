{
  config,
  lib,
  ...
}: let
  cfgOverlays = config.myModules.system.overlays;

  isLinux = config.nixpkgs.hostPlatform.isLinux;
  isDarwin = config.nixpkgs.hostPlatform.isDarwin;

  linuxProgramNames = [
    "common-pkgs"
    "dconf"
    "firefox"
    "fish"
    "git"
    "nh"
    "nvf"
    "steam"
    "tack"
    "desktop-pkgs"
  ];
  linuxSystemNames = [
    "amdgpu"
    "boot"
    "environment"
    "fonts"
    "hardware"
    "nix"
    "time"
    "xkb"
    "openssh"
    "locale"
  ];

  darwinProgramNames = [
    "fish"
    "nh"
  ];
  darwinSystemNames = [
    "nix"
  ];

  overlayNames = [
    "glaze"
    "qt6ct-kde"
    "sddm-astronaut"
    "swash"
  ];

  mkEnables = names: lib.genAttrs names (_: {enable = lib.mkDefault true;});
in {
  options.myModules = {
    programs = {
      common-pkgs.enable = lib.mkEnableOption "common pkgs";
      dconf.enable = lib.mkEnableOption "dconf";
      firefox.enable = lib.mkEnableOption "Firefox";
      fish.enable = lib.mkEnableOption "Fish shell";
      gamescope.enable = lib.mkEnableOption "Gamescope";
      git.enable = lib.mkEnableOption "Git";
      gpu-screen-recorder.enable = lib.mkEnableOption "GPU Screen Recorder";
      nh.enable = lib.mkEnableOption "nh";
      nvf.enable = lib.mkEnableOption "nvf";
      steam.enable = lib.mkEnableOption "Steam";
      tack.enable = lib.mkEnableOption "tack";
      desktop-pkgs.enable = lib.mkEnableOption "common desktop applications";
    };

    system = {
      amdgpu.enable = lib.mkEnableOption "amdgpu video driver";
      boot.enable = lib.mkEnableOption "bootloader and kernel settings";
      environment.enable = lib.mkEnableOption "general environment stuff I want enabled";
      fonts.enable = lib.mkEnableOption "fonts";
      hardware.enable = lib.mkEnableOption "common hardware configuration (bluetooth, graphics, microcode)";
      nix.enable = lib.mkEnableOption "nix settings and configuration, such as enabling flakes and allowing unfree packages";
      openrgb.enable = lib.mkEnableOption "OpenRGB";
      polkit.enable = lib.mkEnableOption "polkit wrapper";
      openssh.enable = lib.mkEnableOption "enable openssh";
      time.enable = lib.mkEnableOption "timezone and locale settings";
      udev.enable = lib.mkEnableOption "udev rules";
      xkb.enable = lib.mkEnableOption "xkb to de";
      locale.enable = lib.mkEnableOption "enable locale";

      overlays = {
        enable = lib.mkEnableOption "all overlays (master switch)";
        glaze.enable = lib.mkEnableOption "glaze overlay";
        qt6ct-kde.enable = lib.mkEnableOption "qt6ct-kde overlay";
        sddm-astronaut.enable = lib.mkEnableOption "sddm-astronaut overlay";
        swash.enable = lib.mkEnableOption "swash overlay";
      };
    };

    desktop = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
          "gnome"
          "plasma"
          "hyprland"
          "niri"
        ]
      );
      default = null;
      description = "Which desktop/window manager this host runs";
    };
  };

  config = lib.mkMerge [
    (lib.mkIf isLinux {
      myModules.programs = mkEnables linuxProgramNames;
      myModules.system = mkEnables linuxSystemNames;
    })

    (lib.mkIf isLinux {
      myModules.system.overlays = lib.genAttrs overlayNames (_: {
        enable = lib.mkDefault cfgOverlays.enable;
      });
    })

    (lib.mkIf isDarwin {
      myModules.programs = mkEnables darwinProgramNames;
      myModules.system = mkEnables darwinSystemNames;
    })

    {
      assertions = [
        {
          assertion = isLinux || config.myModules.desktop == null;
          message = "myModules.desktop is only meaningful on Linux hosts.";
        }
      ];
    }
  ];
}
