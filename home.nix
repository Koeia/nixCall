{ config, pkgs, ... }:

{
    home.username = "jctannu4";
    home.homeDirectory = "/home/jctannu4";
    home.stateVersion = "26.05";
    programs.git = { 
	enable = true;
	userName = "Koeia";
	userEmail = "whereischason@protonmail.com";
  	extraConfig = {
    init.defaultBranch = "main";
  };
};

    home.pointerCursor = {
	gtk.enable = true;
	x11.enable = true;
	package = pkgs.bibata-cursors;
	name = "Bibata-Modern-Classic";
	size = 10;
		};
    programs.zsh = {
        enable = true;
        shellAliases = {
            btw = "echo i use nixos, btw";
	    update = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixCall";
        };
	initContent = ''
		${pkgs.fastfetch}/bin/fastfetch
		'';
    oh-my-zsh = {
	enable = true;
	plugins = [];
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
