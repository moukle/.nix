{
  theme,
  pkgs,
  inputs,
  ...
}: 
{
  wayland.windowManager.hyprland = with theme.colors; {
    plugins = [
      inputs.hyprland-plugins.packages."{$pkgs.system}".hyprbars
    ];

    settings = {
      "plugin:hyprbars" = {
        bar_height = 20;
      };
    };
  };
}
