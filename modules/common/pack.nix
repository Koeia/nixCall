{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    curl
    ffmpeg
    fuzzel
    glaze
    kitty
    ledger-live-desktop
    libreoffice
    libsecret
    p7zip
    package-version-server
    prismlauncher
    proton-pass
    proton-pass-cli
    rclone
    rclone-browser
    tmux
    traceroute
    udiskie
    usbutils
    vim
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
