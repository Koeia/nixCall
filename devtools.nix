{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    nmap
    wireshark-cli
    unzip
    btop
    gzip
  ];
}
