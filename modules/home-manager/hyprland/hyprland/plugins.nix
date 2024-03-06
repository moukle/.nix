{
  theme,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    plugins = [
      # inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
      # inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];


    # "plugin:split-monitor-workspaces" = { count = 5; };

    settings = {
      "plugin:borders-plus-plus" = {
        add_borders = 5; # 0 - 9

        # you can add up to 9 borders
        # "col.border_1" = "rgb(${theme.colors.base})";
        # "col.border_2" = "rgb(${theme.colors.base})";

        # -1 means "default" as in the one defined in general:border_size
        border_size_1 = 10;
        border_size_2 = -1;

        # makes outer edges match rounding of the parent. Turn on / off to better understand. Default = on.
        natural_rounding = "yes";
      };
    };

    # "plugin:split-monitor-workspaces"

    # settings = {
    #   "plugin:hyprbars" = {
    #     bar_height = 20;
    #   };
    # };

  };
}
