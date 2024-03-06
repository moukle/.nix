{
  inputs,
  pkgs,
  theme,
  ... } :
  let inherit (theme) x;
  in
  {
    imports = [inputs.ags.homeManagerModules.default];

  # xdg.configFile."ags".source = "${inputs.aylur-dotfiles}/ags";

  home = {
    file.".cache/ags/options.json".text = with theme.colors; ''
    {
      "autotheme": false,
      "wallpaper": "${theme.wallpaper}",
      "theme.dark.bg": "${x base}",
      "theme.dark.border": "${x overlay0}",
      "theme.dark.error.bg": "${x red}",
      "theme.dark.error.fg": "${x text}",
      "theme.dark.fg": "${x text}",
      "theme.dark.primary.bg": "${x subtext1}",
      "theme.dark.primary.fg": "${x surface0}",
      "theme.dark.secondary.bg": "${x green}",
      "theme.dark.secondary.fg": "${x text}",
      "theme.dark.widget": "${x subtext1}",
      "theme.light.bg": "${x base}",
      "theme.light.border": "${x overlay0}",
      "theme.light.error.bg": "${x red}",
      "theme.light.error.fg": "${x text}",
      "theme.light.fg": "${x text}",
      "theme.light.primary.bg": "${x subtext1}",
      "theme.light.primary.fg": "${x surface0}",
      "theme.light.secondary.bg": "${x overlay0}",
      "theme.light.secondary.fg": "${x text}",
      "theme.light.widget": "${x subtext1}",
      "bar.battery.charging": "${x green}",
      "font.size": 15,
      "bar.corners": false,
      "bar.launcher.label.label": "",
      "bar.workspaces.workspaces": 10,
      "bar.workspaces.colorMonitors": true,
      "bar.taskbar.monochrome": false,
      "bar.taskbar.iconSize": 24,
      "bar.taskbar.exclusive": true,
      "bar.media.monochrome": false,
      "overview.monochromeIcon": false,
      "powermenu.labels": false,
      "quicksettings.media.monochromeIcon": true,
      "quicksettings.media.coverSize": 200,
      "osd.progress.pack.h": "center",
      "osd.progress.pack.v": "end",
      "osd.progress.vertical": false,
      "theme.padding": 7,
      "theme.spacing": 5,
      "font.name": "Inter Variable"
    }
    '';

    packages = with pkgs; [
      sassc
      swww
      brightnessctl
      fd

      inputs.matugen.packages.${system}.default

      hyprpicker
      slurp
      grim
      swappy
      wf-recorder
      wayshot
      imagemagick
      wl-gammactl
      pavucontrol
      libnotify
      (python311.withPackages (p: [p.python-pam]))
    ];
  };

  programs.ags = {
    enable = true;
    extraPackages = [pkgs.libsoup_3];
  };
}
