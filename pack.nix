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
    package-version-server
    dolphin-emu
    cemu
    helix
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
