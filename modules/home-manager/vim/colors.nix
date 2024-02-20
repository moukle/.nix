{ theme, ... } :
let inherit (theme) x;
in {
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      flavour = "frappe";
      integrations.indent_blankline.enabled = true;

      colorOverrides.frappe = with theme.colors; {
        rosewater = x rosewater;
        flamingo = x flamingo;
        pink = x pink;
        mauve = x mauve;
        red = x red;
        maroon = x maroon;
        peach = x peach;
        yellow = x yellow;
        green = x green;
        teal = x teal;
        sky = x sky;
        sapphire = x sapphire;
        blue = x blue;
        lavender = x lavender;
        text = x text;
        subtext1 = x subtext1;
        subtext0 = x subtext0;
        overlay2 = x overlay2;
        overlay1 = x overlay1;
        overlay0 = x overlay0;
        surface2 = x surface2;
        surface1 = x surface1;
        surface0 = x surface0;
        base = x base;
        mantle = x mantle;
        crust = x crust;
      };
    };
  };
}
