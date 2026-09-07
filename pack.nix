{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    fuzzel
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    p7zip
    kitty
    git-credential-manager
    libsecret
    gnome-keyring
    rclone
    rclone-browser
    ffmpeg
    package-version-server
    traceroute
    dolphin-emu
    cemu
    helix
    libreoffice
    worker
    git
    tmux
    vim
    wget
    curl
    alacritty
    glaze
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
