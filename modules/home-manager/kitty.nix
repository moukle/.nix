{ theme, ... }: let inherit (theme) x;
in {
  home.sessionVariables.TERMINAL = "kitty -1";

  programs.kitty = {
    enable = true;

    settings = with theme.colors; {
      font_family = theme.fonts.mono;
      font_size = 14;

      confirm_os_window_close = 0;
      copy_on_select = true;

      allow_remote_control = true;
      window_padding_width = 5;

      foreground = x text;
      background = x base;
      selection_foreground = x text;
      selection_background = x surface1;

      color0  = x surface1;
      color8  = x surface2;
      color1  = x red;
      color9  = x red;
      color2  = x green;
      color10 = x green;
      color3  = x yellow;
      color11 = x yellow;
      color4  = x blue;
      color12 = x blue;
      color5  = x pink;
      color13 = x pink;
      color6  = x teal;
      color14 = x teal;
      color7  = x subtext1;
      color15 = x subtext0;
    };

    extraConfig = ''
      modify_font cell_height 120%
      listen_on unix:/tmp/mykitty
    '';

  };
}
