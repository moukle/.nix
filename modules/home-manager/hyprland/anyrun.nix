{
  config,
  inputs,
  pkgs,
  theme,
  ...
}: let inherit (theme) x;
in {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        # symbols
        translate
        randr
      ];

      width.fraction = 0.5;
      y.absolute = 5;
      hideIcons = false;
      hidePluginInfo = true;
      layer = "overlay";
      ignoreExclusiveZones = false;
      closeOnClick = false;
    };

    extraCss = with theme.colors;
    ''
    * {
      all: unset;
      font: 11pt Inter, sans-serif;
      color: ${x text}
    }

      #window,
      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
      }

      #entry {
        background: ${x base};
        border-radius: 0.5rem;
        margin: 0.5rem;
        padding: 1rem;
      }

      #match.activatable {
        padding: 0.5rem 1rem;
        background: ${x crust};
      }

      #match.activatable:first-child {
        border-radius: 0.5rem 0.5rem 0 0;
      }

      #match.activatable:last-child {
        border-radius: 0 0 0.5rem 0.5rem;
      }

      #match:selected,
      #match:hover,
      #plugin:hover {
        border-radius: 0.5rem;
        background: ${x surface0};
      }

      box#main {
        background: ${x mantle};
        border-radius: 0.5rem;
        padding: 0.5rem;
      }

      list > #plugin {
        border-radius: 0.5rem;
        margin: 0.5rem;
      }
      '';

    extraConfigFiles = {
      "applications.ron".text = ''
        Config(
          desktop_actions: true,
          max_entries: 10,
          terminal: Some("${config.home.sessionVariables.TERMINAL}"),
        )
      '';

      "translate.ron".text = ''
        Config(
          prefix: ":tr",
          language_delimiter: ">",
          max_entries: 5,
        )
      '';
    };
    };
  }
