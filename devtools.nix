{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    nmap
    wireshark-cli
    unzip
    jetbrains.webstorm
    btop
    gzip
    cmake
  ];
}
