{
  programs.nixvim.plugins.which-key = {
    enable = true;

    icons = {
      breadcrumb = "»";
      group = "+";
      separator = ""; # ➜
    };

    registrations = {
      "<leader>f" = "Telescope";
      "<leader>ff" = "Find File";
      "<leader>fr" = "Recently Opened";
      "<leader>fg" = "Find String";
      "<leader>fb" = "Find Buffer";
      "<leader>fp" = "Find Project";
    };
  };
}
