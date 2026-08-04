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
            name = "onedark";
            style = "dark";
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
          dashboard.alpha = {
            enable = true;
            # Must be null: nvf's alpha module defaults `theme` to "dashboard", and it
            # asserts that a built-in theme and a custom layout are never set together.
            theme = null;
            layout = [
              {
                type = "padding";
                val = 4;
              }
              {
                type = "text";
                val = [
                  "  ███╗   ██╗██╗   ██╗██╗███╗   ███╗ "
                  "  ████╗  ██║██║   ██║██║████╗ ████║ "
                  "  ██╔██╗ ██║██║   ██║██║██╔████╔██║ "
                  "  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ "
                  "  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ "
                  "  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ "
                ];
                opts = {
                  position = "center";
                  hl = "String";
                };
              }
              {
                type = "padding";
                val = 2;
              }
              {
                type = "group";
                val = [
                  {
                    type = "button";
                    val = "  Neue Datei";
                    on_press = lib.generators.mkLuaInline "function() vim.cmd('ene | startinsert') end";
                    opts = {
                      position = "center";
                      shortcut = "e";
                      cursor = 3;
                      width = 42;
                      align_shortcut = "right";
                      hl = "Type";
                      hl_shortcut = "Keyword";
                      keymap = [
                        "n"
                        "e"
                        ":ene <BAR> startinsert <CR>"
                        {
                          noremap = true;
                          silent = true;
                          nowait = true;
                        }
                      ];
                    };
                  }
                  {
                    type = "button";
                    val = "  Datei suchen";
                    on_press = lib.generators.mkLuaInline "function() require('telescope.builtin').find_files() end";
                    opts = {
                      position = "center";
                      shortcut = "f";
                      cursor = 3;
                      width = 42;
                      align_shortcut = "right";
                      hl = "Type";
                      hl_shortcut = "Keyword";
                      keymap = [
                        "n"
                        "f"
                        ":lua require('telescope.builtin').find_files()<CR>"
                        {
                          noremap = true;
                          silent = true;
                          nowait = true;
                        }
                      ];
                    };
                  }
                  {
                    type = "button";
                    val = "  Wort suchen";
                    on_press = lib.generators.mkLuaInline "function() require('telescope.builtin').live_grep() end";
                    opts = {
                      position = "center";
                      shortcut = "w";
                      cursor = 3;
                      width = 42;
                      align_shortcut = "right";
                      hl = "Type";
                      hl_shortcut = "Keyword";
                      keymap = [
                        "n"
                        "w"
                        ":lua require('telescope.builtin').live_grep()<CR>"
                        {
                          noremap = true;
                          silent = true;
                          nowait = true;
                        }
                      ];
                    };
                  }
                  {
                    type = "button";
                    val = "  Zuletzt geöffnet";
                    on_press = lib.generators.mkLuaInline "function() require('telescope.builtin').oldfiles() end";
                    opts = {
                      position = "center";
                      shortcut = "r";
                      cursor = 3;
                      width = 42;
                      align_shortcut = "right";
                      hl = "Type";
                      hl_shortcut = "Keyword";
                      keymap = [
                        "n"
                        "r"
                        ":lua require('telescope.builtin').oldfiles()<CR>"
                        {
                          noremap = true;
                          silent = true;
                          nowait = true;
                        }
                      ];
                    };
                  }
                  {
                    type = "button";
                    val = "  Config bearbeiten";
                    on_press = lib.generators.mkLuaInline "function() vim.cmd('cd ~/NixOS-Dots/nixos'); require('telescope.builtin').find_files({ hidden = true, no_ignore = true, follow = true }) end";
                    opts = {
                      position = "center";
                      shortcut = "c";
                      cursor = 3;
                      width = 42;
                      align_shortcut = "right";
                      hl = "Type";
                      hl_shortcut = "Keyword";
                      keymap = [
                        "n"
                        "c"
                        ":lua vim.cmd('cd ~/NixOS-Dots/nixos'); require('telescope.builtin').find_files({ hidden = true, no_ignore = true, follow = true })<CR>"
                        {
                          noremap = true;
                          silent = true;
                          nowait = true;
                        }
                      ];
                    };
                  }
                  {
                    type = "button";
                    val = "  Beenden";
                    on_press = lib.generators.mkLuaInline "function() vim.cmd('qa') end";
                    opts = {
                      position = "center";
                      shortcut = "q";
                      cursor = 3;
                      width = 42;
                      align_shortcut = "right";
                      hl = "Type";
                      hl_shortcut = "Keyword";
                      keymap = [
                        "n"
                        "q"
                        ":qa<CR>"
                        {
                          noremap = true;
                          silent = true;
                          nowait = true;
                        }
                      ];
                    };
                  }
                ];
                opts = {spacing = 1;};
              }
              {
                type = "padding";
                val = 2;
              }
              {
                type = "text";
                val = lib.generators.mkLuaInline "os.date('  %A, %d.%m.%Y  •  %H:%M')";
                opts = {
                  position = "center";
                  hl = "Comment";
                };
              }
            ];
            opts = {
              margin = 5;
            };
          };

          visuals = {
            nvim-web-devicons.enable = true;
            indent-blankline.enable = true;
            fidget-nvim.enable = true; # LSP progress spinner
          };

          binds.whichKey.enable = true; # keybind popup helper
          autopairs.nvim-autopairs.enable = true;

          # Comments / TODOs
          comments.comment-nvim.enable = true;
          notes.todo-comments.enable = true;

          # Navigation
          telescope = {
            enable = true;
            setupOpts = {
              pickers = {
                find_files = {
                  find_command = [
                    "${pkgs.fd}/bin/fd"
                    "--type=file"
                    "--hidden"
                    "--no-ignore"
                  ];
                };
              };
            };
          };

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
