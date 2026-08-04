{...}: {
  programs = {
    fish = {
      enable = true;
      functions = {
        ps5 = ''
          set battery_paths /sys/class/power_supply/ps-controller-battery-*
          if not set -q battery_paths[1]
            echo "🎮 PS5 Controller: nicht verbunden"
            return 1
          end

          set battery_path $battery_paths[1]
          set capacity (cat $battery_path/capacity)
          set battery_status (cat $battery_path/status)

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
        ncg = "nh clean all";
        lg = "lazygit";
        cff = "reset && fastfetch";
        cff2 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/nitch-like/config.jsonc";
        cff3 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/Schlosser/config.jsonc";
        cff4 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/kitty/config.jsonc";
        cff5 = "reset && fastfetch -c ~/.config/fastfetch/other-configs/frieren/config.jsonc";
        cff6 = "reset && python3 ~/NixOS-Dots/misc/misc-text/bunnyfetch.py";
        ff = "fastfetch";
        ff2 = "fastfetch -c ~/.config/fastfetch/other-configs/nitch-like/config.jsonc";
        ff3 = "fastfetch -c ~/.config/fastfetch/other-configs/Schlosser/config.jsonc";
        ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
        ls = "eza -la --icons";
      };
    };
  };
}
