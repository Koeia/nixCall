{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    btop
    (lib.lowPrio busybox)
    claude-code
    cmake
    glib
    gnumake
    gnupg
    gzip
    k6
    keepass
    keepassxc
    musl
    nmap
    pass
    pinentry-all
    pv
    unzip
    wireshark-cli
    zip
  ];
}
