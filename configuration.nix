{
  config,
  lib,
  pkgs,
  inputs,
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
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
          };
        };
      };
    };
  };
  services.tailscale.enable = true;
  services.openssh.enable = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    gcc
    fuzzel
    kitty
    git-credential-manager
    libsecret
    hyprpolkitagent
    keyd
    package-version-server
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
    lua-language-server
    nodejs
    quickshell
    pass
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
