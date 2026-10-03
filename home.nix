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
      safe.directory = "/home/jctannu4";
      credential.credentialStore = "gpg";
    };
  };
  gtk.enable = true;
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.kdePackages.oxygen;
    name = "Oxygen_White";
    size = 28;
    dotIcons.enable = true;
  };

  /*
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting = {
        enable = true;
      };
      shellAliases = {
        pipshell = "nix-shell ~/nixCall";
        update = "sudo nixos-rebuild switch --flake ~/nixCall#nixCall --impure";
        nix-fshell = "nix-shell --run fish";
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
  */

  programs.fish = {
    enable = true;

    shellAliases = {
      pipshell = "nix-shell ~/nixCall";
      update = "sudo nixos-rebuild switch --flake ~/nixCall#nixCall --impure";
      nix-fshell = "nix-shell --run fish";
    };
    functions = {
      fish_greeting = "${pkgs.fastfetch}/bin/fastfetch";
    };
    loginShellInit = ''
      if test -z "$WAYLAND_DISPLAY"; and test "$XDG_VTNR" = 1
        exec start-hyprland
      end
    '';

    plugins = [
      {
        name = "damin";
        src = pkgs.fetchFromGitHub {
          owner = "miniex";
          repo = "fish-theme-damin";
          rev = "v1.3.0";
          hash = "sha256-qjsYROys+Z97fjXn9m0gOlNG9ohDkYpMpDtVMvQ9OsI=";
        };
      }

      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
    ];
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
