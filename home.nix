{ config, pkgs, ... }:

{
    home.username = "jctannu4";
    home.homeDirectory = "/home/jctannu4";
    home.stateVersion = "26.05";
    programs.git.enable = true;
    programs.zsh = {
        enable = true;
        shellAliases = {
            btw = "echo i use nixos, btw";
        };
    ## profileExtra = ''
     # if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      #  exec hyprland
     # fi
    #'';
  };
}
