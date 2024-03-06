{
  programs.nixvim = {
    options.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
      lspkind = {
        enable = true;
        mode = "symbol";
      };

      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      # copilot-cmp.enable = true;
      copilot-vim.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";

            # "<C-j>" = {
            #   modes = ["i" "s"];
            #   action = "cmp.mapping.select_next_item()";
            # };
            # "<Tab>" = {
            #   modes = ["i" "s"];
            #   action = "cmp.mapping.select_next_item()";
            # };
            #
            # "<C-k>" = {
            #   modes = ["i" "s"];
            #   action = "cmp.mapping.select_prev_item()";
            # };
            # "<S-Tab>" = {
            #   modes = ["i" "s"];
            #   action = "cmp.mapping.select_prev_item()";
            # };

            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-l>" = "cmp.mapping.confirm({ select = true })";
          };

          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
        # {name = "copilot";}
        {
          name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
        ];
      };
    };
  };
};
}
