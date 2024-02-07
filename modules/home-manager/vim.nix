{ inputs, pkgs, config, lib, ... }:
{
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

    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.flavour = "frappe";

    plugins.lualine.enable = true;
    plugins.telescope.enable = true;
    plugins.project-nvim.enable = true;
    plugins.nix.enable = true;
    plugins.neogit.enable = true;
    plugins.copilot-vim.enable = true;
    plugins.which-key.enable = true;
    plugins.treesitter.enable = true;
    plugins.nvim-cmp.enable = true;
    plugins.comment-nvim.enable = true;

    plugins.lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
      };
    };
  };
}
