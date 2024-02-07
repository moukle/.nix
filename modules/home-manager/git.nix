{ pkgs, ...}:
{
  programs = {
    git = {
      enable = true;
      package = pkgs.gitAndTools.gitFull;
      lfs.enable = true;
      delta.enable = true;

      userName = "Moritz Klein";
      userEmail = "moritz.klein@pm.me";

      # signing = {
      #   key = "";
      #   signByDefault = true;
      # };

      extraConfig = {
        init = {defaultBranch = "main";};
        core.whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };

    };
  };
}
