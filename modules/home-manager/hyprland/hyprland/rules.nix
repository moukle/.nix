{...}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [ ];

    windowrulev2 = [
      # only allow shadows for floating windows
      "noshadow, floating:0"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      "workspace special silent,class:^(pavucontrol)$"

      # throw sharing indicators away
      # "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      # "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      "workspace 1, class:^(firefox)$"
      "workspace 4, title:^(Spotify)$"
      "workspace 7, title:^(.*(Disc|WebC)ord.*)$"
    ];
  };
}
