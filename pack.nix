{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fuzzel
    p7zip
    kitty
    git-credential-manager
    libsecret
    gnome-keyring
    package-version-server
    dolphin-emu
    cemu
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
