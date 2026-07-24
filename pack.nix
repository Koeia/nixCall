{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    fuzzel
    kitty
    git-credential-manager
    libsecret
    gnome-keyring
    package-version-server
    dolphin-emu
    worker
    git
    vim
    wget
    curl
    alacritty
    waybar
    zed-editor
    quickshell
    brightnessctl
    udiskie
    usbutils
    yazi
    yaziPlugins.drag
    yaziPlugins.chmod
    yaziPlugins.sudo
    yaziPlugins.full-border
    termius
    ledger-live-desktop
  ];

}
