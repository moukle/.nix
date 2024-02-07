{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      material-icons
      material-design-icons
      roboto
      work-sans
      comic-neue
      source-sans
      inter
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
