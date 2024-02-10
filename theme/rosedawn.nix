{
  fonts = {
    mono =  "FiraCode Nerd Font";
    sans =  "DejaVu Sans";
  };

  # convert rrggbb hex to #rrggbb
  x = c: "#${c}";

  colors = rec {
    rosewater = "d6817d";
    flamingo = "d6817d";
    pink = "907aa9";
    mauve = "907aa9";
    red = "b4637a";
    maroon = "b4637a";
    peach = "d6817d";
    yellow = "ea9d34";
    green = "56949f";
    teal = "56949f";
    sky = "286983";
    sapphire = "286983";
    blue = "286983";
    lavender = "907aa9";
    text = "575279";
    subtext1 = "615c84";
    subtext0 = "797593";
    overlay2 = "807c99";
    overlay1 = "9893a5";
    overlay0 = "a19cad";
    surface2 = "cac1b9";
    surface1 = "d1c9c2";
    surface0 = "dcd3cb";
    base = "eee6dd";
    mantle = "e7dbd1";
    crust = "ddd0c6";

    accent = pink;
  };

  wallpaper = ./wall.jpg;
} 
