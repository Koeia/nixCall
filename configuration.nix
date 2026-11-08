{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./modules/services.nix
    ./modules/lsps.nix
    ./modules/devtools.nix
    ./modules/pack.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  users.users.jctannu4 = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
  };

  services.tailscale = {
    enable = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      libsecret
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings.auto-optimise-store = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
