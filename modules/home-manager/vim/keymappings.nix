{
  lib,
  config,
  ...
} : {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

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

          "<leader>ff" = "<cmd>Telescope find_files<CR>";
          "<leader>fr" = "<cmd>Telescope oldfiles<CR>";
          "<leader>fg" = "<cmd>Telescope live_grep<CR>";
          "<leader>fp" = "<cmd>Telescope projects<CR>";
          "<leader>fb" = "<cmd>Telescope buffers<CR>";

          "<leader>g" = "<cmd>Neogit<CR>";
          "<leader>t" = "<cmd>NvimTreeToggle<CR>";
        };
    in
    config.nixvim.helpers.keymaps.mkKeymaps
    {options.silent = true;}
    (normal);
  };
}
