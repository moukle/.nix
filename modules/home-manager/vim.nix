{ theme, inputs, pkgs, config, lib, ... }:
let inherit (theme) x;
in {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";
    globals.maplocalleader = " ";
    globals.clipboard.register = "unnamedplus";
    globals.clipboard.providers.wl-copy.enable = true;

    keymaps = let 
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<Space>" = "<NOP>";
          "<esc>" = ":noh<CR>";

          Y = "y$";
          L = "$";
          H = "^";

          "<leader>gg" = "<cmd>Neogit<CR>";
          "<leader>ff" = "<cmd>Telescope find_files<CR>";
          "<leader>fr" = "<cmd>Telescope oldfiles<CR>";
          "<leader>fg" = "<cmd>Telescope live_grep<CR>";
          "<leader>bb" = "<cmd>Telescope buffers<CR>";
        };
    in
    config.nixvim.helpers.keymaps.mkKeymaps
    {options.silent = true;}
    (normal);

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;

      updatetime = 100;
      swapfile = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
      integrations.indent_blankline.enabled = true;

      colorOverrides.frappe = with theme.colors; {
        rosewater = x rosewater;
        flamingo = x flamingo;
        pink = x pink;
        mauve = x mauve;
        red = x red;
        maroon = x maroon;
        peach = x peach;
        yellow = x yellow;
        green = x green;
        teal = x teal;
        sky = x sky;
        sapphire = x sapphire;
        blue = x blue;
        lavender = x lavender;
        text = x text;
        subtext1 = x subtext1;
        subtext0 = x subtext0;
        overlay2 = x overlay2;
        overlay1 = x overlay1;
        overlay0 = x overlay0;
        surface2 = x surface2;
        surface1 = x surface1;
        surface0 = x surface0;
        base = x base;
        mantle = x mantle;
        crust = x crust;
      };
    };

    # complete
    options.completeopt = ["menu" "menuone" "noselect"];
    plugins.nvim-cmp = {
      enable = true;

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<Esc>" = "cmp.mapping.close()";

          "<C-j>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_next_item()";
          };
          "<Tab>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_next_item()";
          };

          "<C-k>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_prev_item()";
          };
          "<S-Tab>" = {
            modes = ["i" "s"];
            action = "cmp.mapping.select_prev_item()";
          };

          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<C-l>" = "cmp.mapping.confirm({ select = true })";
        };

      sources = [
        {name = "path";}
        {name = "nvim_lsp";}
        # {name = "cmp_tabby";}
        # {name = "luasnip";}
        {
          name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
        {name = "neorg";}
      ];
    };

    plugins.lualine.enable = true;
    plugins.indent-blankline.enable = true;
    plugins.telescope.enable = true;
    plugins.project-nvim.enable = true;
    plugins.nix.enable = true;
    plugins.nvim-colorizer.enable = true;
    plugins.neogit.enable = true;
    plugins.copilot-vim.enable = true;
    plugins.which-key.enable = true;
    plugins.treesitter.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.comment-nvim.enable = true;

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };
  };
}
