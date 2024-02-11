{ pkgs, ... }:

{
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

    shellAliases = {
      ls = "eza --icons auto";

      nrt = "sudo nixos-rebuild test --flake ~/dotfiles#default";
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#default";
      ncg = "sudo nix-collect-garbage";
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      format       = "$character";
      right_format = "$directory$git_branch$git_status$cmd_duration";
      add_newline  = true;

      character =  {
        success_symbol = "[](green bold)";
        error_symbol = "[](red)";
        vicmd_symbol = "[](yellow)";
      };

      directory = {
        format = "[]($style)[ ](bg:black fg:white)[$path](bg:black fg:white bold)[ ]($style)";
        style = "bg:none fg:black";
        truncation_length = 3;
        truncate_to_repo  = false;
      };

      
      git_branch = {
        format = "[]($style)[[ ](bg:black fg:white bold)$branch](bg:black fg:white)[ ]($style)";
        style  = "bg:none fg:black";
      };

      git_status = {
        format     = "[]($style)[$all_status$ahead_behind](bg:black fg:white)[ ]($style)";
        style      = "bg:none fg:black";
        # conflicted = "=";
        # ahead      = "⇡${count}";
        # behind     = "⇣${count}";
        # diverged   = "⇕⇡${ahead_count}⇣\${behind_count}";
        # up_to_date = "";
        # untracked  = "?${count}";
        # stashed    = "";
        # modified   = "!${count}";
        # staged     = "+${count}";
        # renamed    = "»${count}";
        # deleted    = "${count}";
      };

      cmd_duration = {
        format   = "[]($style)[[󰔚 ](bg:black fg:white bold)$duration](bg:black fg:white)[ ]($style)";
        disabled = false;
        style    = "bg:none fg:black";
      };

    };
  };
}
