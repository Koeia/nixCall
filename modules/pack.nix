{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    curl
    ffmpeg
    fish
    fuzzel
    git
    git-credential-manager
    glaze
    gnome-keyring
    kitty
    ledger-live-desktop
    libreoffice
    libsecret
    p7zip
    package-version-server
    prismlauncher
    proton-pass
    proton-pass-cli
    quickshell
    rclone
    rclone-browser
    tmux
    traceroute
    udiskie
    usbutils
    vim
    waybar
    wget
    worker
    xpipe
    yazi
    yaziPlugins.chmod
    yaziPlugins.drag
    yaziPlugins.full-border
    yaziPlugins.sudo
    zed-editor
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];

}
