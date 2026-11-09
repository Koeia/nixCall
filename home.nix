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
  programs.fish = {
    enable = true;

    shellAliases = {
      pipshell = "nix-shell ~/nixCall";
      update = "sudo nixos-rebuild switch --flake ~/nixCall";
      nix-fshell = "nix-shell --run fish";
    };
    functions = {
      fish_greeting = "${pkgs.fastfetch}/bin/fastfetch";
    };

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

  home.packages = with pkgs; [
    git-credential-manager
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
