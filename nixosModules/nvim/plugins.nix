{ }:
{
  lsp = {
    enable = true;
    servers = {
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        settings.check.allTargets = false;
        cmd = [ "/run/current-system/sw/bin/rust-analyzer" ];
      };
      jdtls = {
        enable = true;
      };
    };
  };

  gitsigns = {
    enable = true;
  };

  nvim-autopairs = {
    enable = true;
  };

  precognition = {
    enable = true;
  };

  toggleterm = {
    enable = true;
  };

  barbar = {
    enable = true;
  };

  treesitter = {
    enable = true;
    settings.indent.enable = true;
    settings.shighlight.enable = true;
  };

  luasnip.enable = true;

  cmp-emoji = {
    enable = true;
  };

  cmp-nvim-lsp = {
    enable = true;
  };

  cmp-path = {
    enable = true;
  };

  cmp_luasnip = {
    enable = true;
  };

  cmp = {
    enable = true;

    settings = {
      experimental = {
        ghost_text = true;
      };
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        {
          name = "buffer";
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
        { name = "nvim_lua"; }
        { name = "path"; }
      ];

      formatting = {
        fields = [
          "abbr"
          "kind"
          "menu"
        ];
        format =
          # lua
          ''
            function(_, item)
              local icons = {
                Namespace = "󰌗",
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰆧",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈚",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰊄",
                Table = "",
                Object = "󰅩",
                Tag = "",
                Array = "[]",
                Boolean = "",
                Number = "",
                Null = "󰟢",
                String = "󰉿",
                Calendar = "",
                Watch = "󰥔",
                Package = "",
                Copilot = "",
                Codeium = "",
                TabNine = "",
              }

              local icon = icons[item.kind] or ""
              item.kind = string.format("%s %s", icon, item.kind or "")
              return item
            end
          '';
      };

      window = {
        completion = {
          winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
          scrollbar = false;
          sidePadding = 0;
          border = [
            "╭"
            "─"
            "╮"
            "│"
            "╯"
            "─"
            "╰"
            "│"
          ];
        };

        settings.documentation = {
          border = [
            "╭"
            "─"
            "╮"
            "│"
            "╯"
            "─"
            "╰"
            "│"
          ];
          winhighlight = "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
        };
      };

      mapping = {
        "<C-n>" = "cmp.mapping.select_next_item()";
        "<C-p>" = "cmp.mapping.select_prev_item()";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<S-Tab>" = "cmp.mapping.close()";
        "<Tab>" =
          # lua
          ''
            function(fallback)
              local line = vim.api.nvim_get_current_line()
              if line:match("^%s*$") then
                fallback()
              elseif cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
              else
                fallback()
              end
            end
          '';
        "<Down>" =
          # lua
          ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
              else
                fallback()
              end
            end
          '';
        "<Up>" =
          # lua
          ''
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
              else
                fallback()
              end
            end
          '';
      };
    };
  };

  which-key = {
    enable = true;
  };

  comment = {
    enable = true;
  };

  lualine = {
    enable = true;
  };

  ## Configurar
  #lazy = {
  #  enable = true;
  #};

  nvim-tree = {
    enable = true;
  };

  web-devicons = {
    enable = true;
  };

  telescope = {
    enable = true;
  };
}
