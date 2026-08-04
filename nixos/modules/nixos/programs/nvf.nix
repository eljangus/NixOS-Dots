{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.myModules.programs.nvf.enable {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          theme = {
            enable = true;
            name = "tokyonight";
            style = "storm";
            transparent = false;
          };

          options = {
            expandtab = true;
            tabstop = 2;
            shiftwidth = 2;
            number = true;
            relativenumber = false;
            ignorecase = true;
            smartcase = true;
            mouse = "a";
            hlsearch = true;
            incsearch = true;
            swapfile = false;
            termguicolors = true;
          };

          clipboard = {
            enable = true;
            registers = "unnamedplus";
            providers.wl-copy.enable = true;
          };

          # UI / QoL
          statusline.lualine.enable = true;
          tabline.nvimBufferline.enable = true;

          visuals = {
            nvim-web-devicons.enable = true;
            indent-blankline.enable = true;
            fidget-nvim.enable = true; # LSP progress spinner
          };

          binds.whichKey.enable = true; # keybind popup helper
          autopairs.nvim-autopairs.enable = true;

          # File explorer + dashboard
          filetree.nvimTree = {
            enable = true;
            mappings.toggle = "<leader>e";
            view = {
              width = {
                min = 25;
                max = 30;
                padding = 1;
              };
            };
          };

          # Comments / TODOs
          comments.comment-nvim.enable = true;
          notes.todo-comments.enable = true;

          # Navigation
          telescope.enable = true;

          # Git
          git.gitsigns.enable = true;

          # Completion
          autocomplete.nvim-cmp.enable = true;

          # LSP / languages
          lsp = {
            enable = true;
            lightbulb.enable = true;
            mappings.format = null;
          };
          languages = {
            enableTreesitter = true;
            enableFormat = true;
            nix = {
              enable = true;
              lsp.servers = ["nixd"];
              format.type = ["alejandra"];
            };
            python.enable = true;
            markdown.enable = true;
            bash.enable = true;
          };

          keymaps = [
            {
              key = "<leader>lf";
              mode = ["n" "v"];
              action = "<cmd>lua require('conform').format({ lsp_format = 'fallback' })<CR>";
              desc = "Format file";
            }
            {
              key = "<leader>bd";
              action = ":bdelete<CR>";
              mode = "n";
              silent = true;
              desc = "Buffer/Datei schliessen";
            }
            {
              key = "<F4>"; # Alternativ eine F-Taste, falls leader zickt
              action = ":bdelete<CR>";
              mode = "n";
              silent = true;
              desc = "Buffer mit F4 schliessen";
            }
          ];
        };
      };
    };
  };
}
