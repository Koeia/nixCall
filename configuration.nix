{ pkgs, inputs, ... }:

{
  imports = [
    ./services.nix
    /etc/nixos/hardware-configuration.nix
    ./lsps.nix
    ./devtools.nix
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

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    fuzzel
    kitty
    git-credential-manager
    libsecret
    gnome-keyring
    package-version-server
    git
    vim
    wget
    curl
    alacritty
    waybar
    zed-editor
    quickshell
    kdePackages.dolphin
    brightnessctl
    udiskie
    usbutils
    yazi
    yaziPlugins.drag
    yaziPlugins.chmod
    yaziPlugins.sudo
    yaziPlugins.full-border
    termius
  ];

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
