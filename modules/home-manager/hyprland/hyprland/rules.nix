{...}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [ ];

    windowrulev2 = [
      # only allow shadows for floating windows
      "noshadow, floating:0"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      # Center and resize open file dialogs
      "center,title:(Open File)"
      "size 50% 50%,title:(Open File)"

      # Center and resize save as dialogs
      "center,title:(Save As)"
      "size 50% 50%,title:(Save As)"

      # "workspace special silent,class:^(pavucontrol)$"

      # throw sharing indicators away
      # "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      # "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      "workspace 1, class:^(firefox)$"
      "workspace 4, title:^(Spotify)$"
      "workspace 7, title:^(.*(Disc|WebC)ord.*)$"
      "workspace 0, title:^(DDNet)$"
    ];
  };
}
