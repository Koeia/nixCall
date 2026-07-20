{ pkgs, ... }:

{
  home.username = "jctannu4";
  home.homeDirectory = "/home/jctannu4";
  home.stateVersion = "26.05";
  programs.git = {
    enable = true;
    settings = {
      credential.helper = "manager";
      user = {
        name = "Koeia";
        email = "whereischason@protonmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "vim";
      pull.rebase = false;
      credential.credentialStore = "gpg";
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "mochaDark";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake ~/nixCall#nixCall --impure";
    };
    initContent = ''
      		${pkgs.fastfetch}/bin/fastfetch
      		'';
    oh-my-zsh = {
      enable = true;
      plugins = [ ];
      theme = "aussiegeek";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec start-hyprland
      fi
    '';
  };

  home.file.".config/hypr".source = ./config/hypr;

  home.packages = with pkgs; [
    git
    git-credential-manager
    git-credential-oauth
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}
