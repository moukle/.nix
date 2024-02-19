{ pkgs, lib, config, ... }:
let
  mod = "SUPER";
  modshift = "${mod}SHIFT";

  workspaces = builtins.concatLists (builtins.genList (
    x: let
      ws = let
        c = (x + 1) / 10;
      in
      builtins.toString (x + 1 - (c * 10));
    in [
      "${mod}, ${ws}, workspace, ${toString (x + 1)}"
      "${mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
    ]
    )
    10);
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      # hypr
      "${mod} SHIFT, Q, exit"
      "${mod}, C, killactive"

      "${mod}, H, movefocus, l"
      "${mod}, L, movefocus, r"
      "${mod}, K, movefocus, u"
      "${mod}, J, movefocus, d"

      "${mod} SHIFT, H, movewindow, l"
      "${mod} SHIFT, L, movewindow, r"
      "${mod} SHIFT, K, movewindow, u"
      "${mod} SHIFT, J, movewindow, d"

      "${mod}, F, fullscreen"

      # progs
      "${mod}, RETURN, exec, kitty"
      "${mod}, D, exec, pkill .anyrun-wrapped || anyrun"
    ] ++ workspaces;

    bindr = [ ]; 

    bindm = [
      "${mod},mouse:272,movewindow"
      "${mod},mouse:273,resizewindow"
    ];
  };
}

