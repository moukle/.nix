{
  theme,
  ...
}:
{
  wayland.windowManager.hyprland.settings = with theme.colors; {
    exec-once = [
      "ags"
      "hyprctl setcursor Qogir 32"
      "firefox"
    ];

    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 3;

      "col.active_border" = "rgb(${overlay2})";
      "col.inactive_border" = "rgb(${base})";

      resize_on_border = true;
    };

    decoration = {
      rounding = 8;

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 2";
      shadow_range = 20;
      shadow_render_power = 5;
      "col.shadow" = "rgba(00000055)";

      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;

        passes = 5;
        size = 10;
      };
    };

    animations = {
      enabled = true;

      bezier = [ "md3_decel, 0.05, 0.7, 0.1, 1"];

      animation = [
        "border, 1, 2, default"
        "fade, 1, 2, md3_decel"
        "windows, 1, 4, md3_decel, popin 60%"
        "workspaces, 1, 4, md3_decel, slidevert"
      ];
    };

    input = {
      kb_layout = "us";
      kb_options = "ctrl:nocaps";
      # kb_variant = "nodeadkeys";

      accel_profile = "flat";
      follow_mouse = 1;

      touchpad = {
        disable_while_typing = true;
        natural_scroll = true;
        scroll_factor = 0.5;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    misc = {
      animate_mouse_windowdragging = false;
      disable_autoreload = false;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      focus_on_activate = true;
      force_default_wallpaper = 1;
    };

    monitor = [
      "DP-1, highres, 1920x0, 1"
      "DP-2, highrr, 0x0, 1"
    ];

    workspace = [
      "1, monitor:DP-1"
      "2, monitor:DP-1"
      "3, monitor:DP-1"
      "4, monitor:DP-1"
      "5, monitor:DP-1"
      "6, monitor:DP-1"
      "7, monitor:DP-1"

      "8, monitor:DP-2"
      "9, monitor:DP-2"
      "10,monitor:DP-2"
    ];
  };
}
