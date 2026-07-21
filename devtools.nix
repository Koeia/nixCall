{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    gnupg
    nmap
    pass
    pinentry-all
    wireshark-cli
    jetbrains.gateway
    unzip
    jetbrains.webstorm
    jetbrains-toolbox
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
