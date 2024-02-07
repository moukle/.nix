{
  theme,
  ...
}: 
{
  wayland.windowManager.hyprland.settings = with theme.colors; {
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 8;

      "col.active_border" = "rgb(${surface1})";
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
        enabled = false;
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
      kb_layout = "de";
      kb_options = "ctrl:nocaps";
      kb_variant = "nodeadkeys";

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
      #disable_autoreload = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      focus_on_activate = true;
      force_default_wallpaper = 1;
    };

    monitor = [ "eDP-1, highres, auto, 1" ];
  };
}
