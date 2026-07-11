{ config, ... }:

{
  home.stateVersion = "26.05";
  home.username = "kdelias";
  home.homeDirectory = "/home/kdelias";

  imports = [
    ./common/common-home.nix
  ];

  # Fish shell configuration
  programs.fish = {
    enable = true;
    functions = {
      ps5 = ''
          set capacity (cat /sys/class/power_supply/ps-controller-battery-4c:b9:9b:cc:ba:12/capacity)
          set battery_status (cat /sys/class/power_supply/ps-controller-battery-4c:b9:9b:cc:ba:12/status)

          # Simple bar
          set bar_length 20
          set filled (math "round($capacity / 100 * $bar_length)")
          set empty (math "$bar_length - $filled")

          set bar (string repeat -n $filled '█')(string repeat -n $empty '░')

          echo "🎮 PS5 Controller: [$bar] $capacity% ($battery_status)"
      '';
    };
    shellInit = ''
      set -U fish_greeting ""
    '';
    shellAliases = {
      nrs = "nh os switch ~/NixOS-Dots/nixos#kde-btw";
      nrb = "nh os boot ~/NixOS-Dots/nixos#kde-btw";
      nfu = "nix flake update";
      nce = "vim ~/NixOS-Dots/nixos/modules/kde.nix";
      nhe = "vim ~/NixOS-Dots/nixos/home-modules/kdelias.nix";
      nfe = "vim ~/NixOS-Dots/nixos/flake.nix";
      try = "NIXPKGS_ALLOW_UNFREE=1 nix-shell -p";
      ncg = "sudo nix-collect-garbage -d";
      cff = "reset && fastfetch";
      cff2 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/nitch-like/config.jsonc";
      cff3 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/Schlosser/config.jsonc";
      ff = "fastfetch";
      ff2 = "fastfetch -c ~/.config/fastfetch/other-configs/nitch-like/config.jsonc";
      ff3 = "fastfetch -c ~/.config/fastfetch/other-configs/Schlosser/config.jsonc";
      ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      ls = "eza -la --icons";
    };
  };
}
