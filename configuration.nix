{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixCall";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  time.timeZone = "America/New_York";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  users.users.jctannu4 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  services.udisks2.enable = true;
  services.tailscale.enable = true;
  services.openssh.enable = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    kitty
    git-credential-manager
    libsecret
    hyprpolkitagent
    keyd
    git
    vim
    wget
    curl
    alacritty
    waybar
    neovim
    zed-editor
    nil
    nixd
    quickshell
    kdePackages.dolphin
    brightnessctl
    udiskie
    usbutils
    yazi
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "26.05";

}
