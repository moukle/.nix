{
  pkgs,
  theme,
  ...
}: let
  inherit (theme) x;
  inherit (theme) colors;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";

    settings = [
      {
        layer = "top";
        position = "left";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        spacing = 0;
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["tray" "custom/notification" "group/network-pulseaudio-backlight-battery" "group/powermenu"];

        # Distro Logo
        "custom/logo" = {
          on-click = "anyrun";
          format = " ";
          tooltip = false;
        };

        # Workspaces
        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          disable-scroll = true;
          on-click = "activate";
          format = "{icon}";
          persistent-workspaces = {
            "*" = 5;
          };
          format-icons = {
            "1" = "●";
            "2" = "●";
            "3" = "●";
            "4" = "●";
            "5" = "●";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "0";
          };
        };

        # Tray
        tray = {
          icon-size = 16;
          show-passive-items = true;
          spacing = 8;
        };

        # Notifications
        "custom/notification" = {
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          return-type = "json";
          format = "{icon}";
          format-icons = {
            notification = "󰂚";
            none = "󰂜";
            dnd-notification = "󰂛";
            dnd-none = "󰪑";
            inhibited-notification = "󰂛";
            inhibited-none = "󰪑";
            dnd-inhibited-notification = "󰂛";
            dnd-inhibited-none = "󰪑";
          };
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          tooltip = true;
          escape = true;
        };

        # Group
        "group/network-pulseaudio-backlight-battery" = {
          modules = [
            "network"
            "group/audio-slider"
            "group/light-slider"
            "battery"
          ];
          orientation = "inherit";
        };

        # Network
        network = {
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-disconnected = "󰖪";
          tooltip-format-wifi = "WiFi: {essid} ({signalStrength}%)\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-ethernet = "Ethernet: {ifname}\n󰅃 {bandwidthUpBytes} 󰅀 {bandwidthDownBytes}";
          tooltip-format-disconnected = "Disconnected";
          on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
        };

        # Pulseaudio
        "group/audio-slider" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "audio-slider-child";
            transition-left-to-right = false;
          };
          modules = ["pulseaudio" "pulseaudio/slider"];
        };
        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "vertical";
        };
        pulseaudio = {
          format = "{icon}";
          format-bluetooth = "󰂯";
          format-muted = "󰖁";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
          };
          tooltip-format = "Volume: {volume}%";
          on-click = "${pkgs.pamixer}/bin/pamixer --toggle-mute";
          on-scroll-up = "${pkgs.pamixer}/bin/pamixer --decrease 1";
          on-scroll-down = "${pkgs.pamixer}/bin/pamixer --increase 1";
        };

        # Backlight
        "group/light-slider" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 300;
            children-class = "light-slider-child";
            transition-left-to-right = false;
          };
          modules = ["backlight" "backlight/slider"];
        };
        "backlight/slider" = {
          min = 0;
          max = 100;
          orientation = "vertical";
        };
        backlight = {
          format = "{icon}";
          format-icons = ["󰝦" "󰪞" "󰪟" "󰪠" "󰪡" "󰪢" "󰪣" "󰪤" "󰪥"];
          tooltip-format = "Backlight: {percent}%";
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set 1%-";
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set +1%";
        };

        # Battery
        battery = {
          format = "{icon}";
          format-charging = "󱐋";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-plugged = "󰚥";
          states = {
            warning = 30;
            critical = 20;
          };
          tooltip-format = "{timeTo}, {capacity}%";
        };

        # Clock & Calendar
        clock = {
          rotate = 270;
          format = "{:%H:%M}";
          actions = {
            on-scroll-down = "shift_down";
            on-scroll-up = "shift_up";
          };
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            format = {
              days = "<span color='${x colors.subtext1}'><b>{}</b></span>";
              months = "<span color='${x colors.text}'><b>{}</b></span>";
              today = "<span color='${x colors.text}'><b><u>{}</u></b></span>";
              weekdays = "<span color='${x colors.blue}'><b>{}</b></span>";
            };
            mode = "month";
            on-scroll = 1;
          };
        };

        # Powermenu
        "group/powermenu" = {
          drawer = {
            children-class = "powermenu-child";
            transition-duration = 300;
            transition-left-to-right = false;
          };
          modules = [
            "custom/power"
            "custom/exit"
            "custom/lock"
            "custom/suspend"
            "custom/reboot"
          ];
          orientation = "inherit";
        };
        "custom/power" = {
          format = "󰐥";
          on-click = "${pkgs.systemd}/bin/systemctl poweroff";
          tooltip = false;
        };
        "custom/exit" = {
          format = "󰈆";
          on-click = "${pkgs.systemd}/bin/loginctl terminate-user $USER";
          tooltip = false;
        };
        "custom/lock" = {
          format = "󰌾";
          on-click = "${pkgs.systemd}/bin/loginctl lock-session";
          tooltip = false;
        };
        "custom/suspend" = {
          format = "󰤄";
          on-click = "${pkgs.systemd}/bin/systemctl suspend";
          tooltip = false;
        };
        "custom/reboot" = {
          format = "󰜉";
          on-click = "${pkgs.systemd}/bin/systemctl reboot";
          tooltip = false;
        };
      }
    ];

    style = let
      snowflake = builtins.fetchurl rec {
        name = "Logo-${sha256}.svg";
        url = "https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake.svg";
        sha256 = "14mbpw8jv1w2c5wvfvj8clmjw0fi956bq5xf9s2q3my14far0as8";
      };
    in ''
      * {
        all: unset;
        font: 13pt "Material Design Icons", Inter, sans-serif;
        min-height: 0;
        min-width: 0;
      }

      menu,
      tooltip {
        background: ${x colors.surface0};
        border: 1px solid ${x colors.subtext1};
        border-radius: 0.5rem;
        padding: 0.5rem;
      }

      menu {
        padding: 0;
      }

      menu label,
      tooltip label {
        padding: 0.5rem;
      }

      button {
        box-shadow: inset 0 -0.25rem transparent;
        border: none;
      }

      button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
      }

      slider {
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }

      trough {
        min-height: 5rem;
        min-width: 0.625rem;
        border-radius: 0.5rem;
        background-color: ${x colors.base};
      }

      highlight {
        min-width: 0.625rem;
        border-radius: 0.5rem;
      }

      window#waybar {
        background: ${x colors.surface0};
        color: ${x colors.subtext1};
      }

      .modules-left {
        padding-top: 0.5rem;
      }

      .modules-right {
        padding-bottom: 0.5rem;
      }

      #custom-logo,
      #workspaces,
      #tray,
      #custom-notification,
      #network-pulseaudio-backlight-battery,
      /* # clock, */
      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        background: ${x colors.surface1};
        border: 1px solid ${x colors.surface1};
        border-radius: 1.5rem;
        min-width: 0.75rem;
        margin: 0.25rem 0.5rem;
      }

      #network,
      #pulseaudio,
      #battery,
      #backlight {
        color: ${x colors.subtext0};
      }

      #tray,
      #custom-notification,
      #network-pulseaudio-backlight-battery,
      #clock {
        padding: 0.5rem 0;
      }

      #network,
      #pulseaudio,
      #pulseaudio-slider,
      #backlight,
      #backlight-slider,
      #battery {
        background: transparent;
        padding: 0.25rem 0.5rem;
      }

      #custom-logo,
      #custom-exit,
      #custom-lock,
      #custom-suspend,
      #custom-reboot,
      #custom-power {
        padding: 0.5rem;
      }

      #custom-logo {
        background: transparent
          url("${snowflake}")
          center/2rem no-repeat;
        border: none;
      }

      #workspaces {
        padding: 0.75rem 0.5rem;
      }

      #workspaces button {
        color: ${x colors.overlay0};
        border-radius: 1rem;
        margin-bottom: 0.75rem;
        transition: all 0.5s steps(12);
      }

      #workspaces button:last-child {
        margin-bottom: 0;
      }

      #workspaces button:hover {
        color: alpha(${x colors.surface0}, 0.5);
      }

      #workspaces button.empty {
        color: ${x colors.surface1};
      }

      #workspaces button.empty:hover {
        color: alpha(${x colors.surface1}, 0.5);
      }

      #workspaces button.urgent {
        color: ${x colors.base};
        background: ${x colors.red};
      }

      #workspaces button.urgent:hover {
        color: alpha(${x colors.red}, 0.5);
      }

      #workspaces button.special {
        color: ${x colors.yellow};
      }

      #workspaces button.special:hover {
        color: alpha(${x colors.yellow}, 0.5);
      }

      #workspaces button.active {
        color: ${x colors.maroon};
      }

      #workspaces button.active:hover {
        color: alpha(${x colors.blue}, 0.5);
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: ${x colors.red};
      }

      #tray menu menuitem {
        border-radius: 0.5rem;
        color: ${x colors.text};
        padding: 0.25rem;
      }

      #tray menu menuitem:hover {
        background: ${x colors.blue};
        color: ${x colors.surface0};
      }

      #custom-notification {
        color: ${x colors.yellow};
      }

      #network.disconnected,
      #pulseaudio.muted {
        color: ${x colors.red};
      }

      #backlight-slider highlight,
      #pulseaudio-slider highlight {
        background-color: ${x colors.subtext1};
      }

      #battery.charging,
      #battery.plugged {
        color: ${x colors.green};
      }

      #battery.critical:not(.charging) {
        color: ${x colors.red};
        animation: blink 0.5s steps(12) infinite alternate;
      }

      #custom-exit {
        color: ${x colors.blue};
      }

      #custom-lock {
        color: ${x colors.green};
      }

      #custom-suspend {
        color: ${x colors.yellow};
      }

      #custom-reboot {
        color: ${x colors.peach};
      }

      #custom-power {
        color: ${x colors.red};
      }

      @keyframes blink {
        to {
          color: ${x colors.text};
        }
      }
    '';
  };
}
