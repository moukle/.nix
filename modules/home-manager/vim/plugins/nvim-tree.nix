{
  programs.nixvim.plugins.nvim-tree = {
    enable = true;
    autoClose = true;
    git.enable = false;
    updateFocusedFile.enable = true;
    updateFocusedFile.updateRoot = true;

    renderer = {
      rootFolderLabel = false;
      # indentMarkers.enable = true;

      icons.glyphs.folder.arrowOpen = "";
      icons.glyphs.folder.arrowClosed = "";
    };
  };

  # programs.nixvim.autoCmd = [
  #   {
  #     # Close Vim if Tree is last buffer
  #     event = "BufEnter";
  #     command = "++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif";
  #   }
  # ];
}
