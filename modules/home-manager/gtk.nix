{ pkgs, ... }:
let
  gtk-theme = "adw-gtk3-dark";
  cursor-theme = "Qogir";
  cursor-package = pkgs.qogir-icon-theme;
in
{
  home = {
    packages = with pkgs; [
      adw-gtk3
      gnome.adwaita-icon-theme
      morewaita-icon-theme
      qogir-icon-theme
      dconf
    ];

    sessionVariables = {
      XCURSOR_THEME = cursor-theme;
      XCURSOR_SIZE = "24";
    };

    pointerCursor = {
      package = cursor-package;
      name = cursor-theme;
      size = 24;
      gtk.enable = true;
    };
  };

  # programs.dconf.enable = true;

  gtk = {
    enable = true;
    theme.name = gtk-theme;
    cursorTheme = {
      name = cursor-theme;
      package = cursor-package;
    };
    iconTheme.name = "MoreWaita";
  };
}
