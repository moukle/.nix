let
  # dark
  rosebox    = import ./colors/rosebox.nix;
  catppuccin = import ./colors/catppuccin.nix;
  adwaita = import ./colors/adwaita.nix;

  # light
  rosedawn = import ./colors/rosedawn.nix;
  ayu      = import ./colors/ayu-light.nix;

  theme = adwaita;
in
{
  colors = theme.colors;
  wallpaper = theme.wallpaper;

  x = c: "#${c}";

  fonts = {
    mono =  "CommitMono";
    sans =  "DejaVu Sans";
  };
}
