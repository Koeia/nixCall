{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    gnupg
    nmap
    claude-code
    pass
    pinentry-all
    wireshark-cli
    musl
    busybox
    k6
    unzip
    keepass
    keepassxc
    btop
    gzip
    glib
    cmake
    zip
    gnumake
  ];
}
