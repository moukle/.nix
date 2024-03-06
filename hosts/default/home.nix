{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/hyprland
    ../../modules/home-manager/swaync.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/firefox.nix

    ../../modules/home-manager/gtk.nix

    ../../modules/home-manager/vim
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/git.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "mori";
  home.homeDirectory = "/home/mori";

  home.stateVersion = "23.11";

  home.packages = with pkgs; [ ];

  home.file = { };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

}
