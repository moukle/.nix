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
      commit-mono
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
