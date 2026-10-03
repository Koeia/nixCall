{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    fuzzel
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    p7zip
    kitty
    prismlauncher
    git-credential-manager
    libsecret
    gnome-keyring
    rclone
    fish
    proton-pass
    proton-pass-cli
    rclone-browser
    ffmpeg
    package-version-server
    traceroute
    libreoffice
    worker
    git
    tmux
    vim
    xpipe
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
    ledger-live-desktop
  ];

}
