{
  programs.nixvim = {
    globals = {
      clipboard.register = "unnamedplus";
      clipboard.providers.wl-copy.enable = true;
    };

    options = {
      number = true;
      relativenumber = true;

      cursorline = true;

      shiftwidth = 4;
      tabstop = 4;
      softtabstop = 4;
      smartindent = true;
      expandtab = true;

      list = true;
      listchars = "tab:⇥ ,trail:░";

      showmatch = true;

      splitbelow = true;
      splitright = true;

      updatetime = 100;
      swapfile = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      foldlevel = 99;
    };
  };
}
