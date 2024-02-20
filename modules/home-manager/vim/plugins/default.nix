{
  imports = [
    ./completion.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./nvim-colorizer.nix
    ./nvim-tree.nix
    ./wilder.nix
    ./which-key.nix

    ./extra.nix
  ];

  programs.nixvim.plugins = {
        project-nvim.enable = true;
        telescope = {
          enable = true;
          extensions.project-nvim.enable = true;
        };

        neogit = {
          enable = true;
          disableHint = true;
        };

        conform-nvim = {
          enable = true;
          formattersByFt = {
            nix = ["alejandra"];
          };
        };

        nvim-ufo = {
          enable = true;
          openFoldHlTimeout = 0;
        };

        nix.enable = true;
        treesitter.enable = true;
        nvim-autopairs.enable = true;
        comment-nvim.enable = true;
        surround.enable = true;
        todo-comments.enable = true;
        notify.enable = true;
  };
}
