{
  programs.nixvim.plugins = {
    nvim-colorizer = {
      enable = true;
      userDefaultOptions = {
        RRGGBB = true;
        RGB = true;
        names = false;
      };
    };
  };
}
