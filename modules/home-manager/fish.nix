{ pkgs, ... }:

{
  programs.starship.enable = true;
  programs.fish = {
    enable = true;
    plugins = [
      { name = "z"; src = pkgs.fishPlugins.z.src; }
      { name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
      { name = "done"; src = pkgs.fishPlugins.done.src; }
      { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
      { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    ];

    interactiveShellInit = ''
	set fish_greeting
        fish_vi_key_bindings
        starship init fish | source
    '';
  };
}
