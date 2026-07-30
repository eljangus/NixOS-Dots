{ ... }:

{
  programs = {
    fish = {
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
        nfu = "nix flake update --flake ~/NixOS-Dots/nixos";
        try = "NIXPKGS_ALLOW_UNFREE=1 nix-shell -p";
        ncg = "nh clean all";
        ncr = "nix run github:greyxp1/ncr";
        cff = "reset && fastfetch";
        cff2 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/nitch-like/config.jsonc";
        cff3 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/Schlosser/config.jsonc";
        cff4 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/kitty/config.jsonc";
        cff5 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/frieren/config.jsonc";
        ff = "fastfetch";
        ff2 = "fastfetch -c ~/.config/fastfetch/other-configs/nitch-like/config.jsonc";
        ff3 = "fastfetch -c ~/.config/fastfetch/other-configs/Schlosser/config.jsonc";
        ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
        ls = "eza -la --icons";
      };
    };
  };
}
