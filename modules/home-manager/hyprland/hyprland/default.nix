{ pkgs, theme, lib, ... }:
with lib; let
  mkService = lib.recursiveUpdate {
    Unit.PartOf = [ "graphical-session.target" ];
    Unit.After  = [ "graphical-session.target" ];
    Install.WantedBy = [ "graphical-session.target" ];
  };
in {
  imports = [ ./options.nix ./binds.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    systemd = {
      variables = [ "--all" ];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  services = {
    wlsunset = {
      enable = true;
      latitude = "49.873";
      longitude = "8.651";
      systemdTarget = "hyprland-session.target";
    };
  };

  systemd.user.services = {
    swaybg = mkService {
      Unit.description = "Wallpaper chooser";
      Service = {
        ExecStart = "${lib.getExe pkgs.swaybg} -i ${theme.wallpaper} -m fill";
        Restart = "always";
      };
    };
  };
}
