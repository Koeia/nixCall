{ pkgs, inputs, ... }:

{
  imports = [
    ./services.nix
    /etc/nixos/hardware-configuration.nix
    ./lsps.nix
    ./devtools.nix
    ./pack.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixCall";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  time.timeZone = "America/New_York";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.jctannu4 = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = with pkgs; pinentry-all;
    enableSSHSupport = true;
  };

  services.tailscale = {
    enable = true;
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.tailscale;
  };

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

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

  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";

}
