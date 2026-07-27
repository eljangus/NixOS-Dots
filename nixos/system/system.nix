{ config, pkgs, inputs, ... }:

{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  networking = {
    hostName = "nix-btw";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  time.timeZone = "Europe/Berlin";
  i18n = {
    defaultLocale = "de_DE.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  hardware = {
    bluetooth.enable = true;
    cpu.amd.updateMicrocode = true;
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  zramSwap.enable = true;

  programs = {
    git.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
        dates = "weekly";
      };
    };
  };

  services = {
    xserver.videoDrivers = ["amdgpu"];
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      audio.enable = true;
    };
    udev.extraRules = ''
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f523", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3554", ATTRS{idProduct}=="f522", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3837", ATTRS{idProduct}=="100b", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3837", ATTRS{idProduct}=="4019", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff01", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2402", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="ff02", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="03eb", ATTRS{idProduct}=="2403", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="31e3", MODE="0666", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTRS{idVendor}=="31e3", MODE="0666", TAG+="uaccess"
    '';
    xserver.xkb = {
      layout = "de";
      variant = "";
    };
  };

  console.keyMap = "de";

  nixpkgs = {
    overlays = [
      (final: prev: {
        qt6ct-kde = prev.kdePackages.qt6ct.overrideAttrs (old: {
          patches = (old.patches or []) ++ [ ../patches/qt6ct-shenanigans.patch ];
          nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
            prev.kdePackages.kconfig
            prev.kdePackages.kcolorscheme
            prev.kdePackages.kiconthemes
          ];
        });
      })
      (final: prev: {
        noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
      (final: prev: {
        sddm-astronaut = prev.sddm-astronaut.override {
          embeddedTheme = "purple_leaves";
        };
      })
      (final: prev: {
        swash = inputs.swash.packages.${pkgs.stdenv.hostPlatform.system}.default;
      })
      (final: prev: {
        niri = prev.niri.override {
          libdisplay-info = prev.libdisplay-info.overrideAttrs (finalAttrs: {
            version = "0.3.0";
            src = prev.fetchFromGitLab {
              domain = "gitlab.freedesktop.org";
              owner = "emersion";
              repo = "libdisplay-info";
              rev = finalAttrs.version;
              sha256 = "sha256-nXf2KGovNKvcchlHlzKBkAOeySMJXgxMpbi5z9gLrdc=";
            };
          });
        };
      })
    ];
    config = {
      permittedInsecurePackages = [
        "electron-40.10.5"
      ];
      allowUnfree = true;
    };
  };

  documentation.nixos.enable = false;

  nix = {
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };
  };

  system.stateVersion = "26.05";
}
