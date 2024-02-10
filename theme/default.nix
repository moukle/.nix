{
  fonts = {
    mono =  "FiraCode Nerd Font";
    sans =  "DejaVu Sans";
  };

  # convert rrggbb hex to #rrggbb
  x = c: "#${c}";

  colors = rec {
    rosewater = "a57562";
    flamingo = "a57562";
    pink = "b48ead";
    mauve = "b48ead";
    red = "bf616a";
    maroon = "bf616a";
    peach = "d08770";
    yellow = "ebcb8b";
    green = "a3be8c";
    teal = "8fbcbb";
    sky = "88c0d0";
    sapphire = "88c0d0";
    blue = "5e81ac";
    lavender = "81a1c1";
    text = "a3a5aa";
    subtext1 = "878991";
    subtext0 = "6e7177";
    overlay2 = "5c5c5c";
    overlay1 = "525252";
    overlay0 = "474747";
    surface2 = "3d3d3d";
    surface1 = "333333";
    surface0 = "282828";
    base = "232323";
    mantle = "1e1e1e";
    crust = "191919";

    accent = pink;
  };

  wallpaper = ./clearing.jpg;
} 
