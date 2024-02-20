{
  programs.nixvim.plugins = {
    lualine = {
      enable = true;
      theme = "catppuccin";
      globalstatus = true;

      componentSeparators.left = " ";
      componentSeparators.right = " ";

      sectionSeparators.left = "";
      sectionSeparators.right = "";

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "" ];
        lualine_c = [ "branch" ];

        lualine_x = [ "filename" ];
        lualine_y = [ "" ];
        lualine_z = [ "progress" ];
      };
    };
  };
}
