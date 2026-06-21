{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    nmap
    wireshark-cli
		jetbrains.gateway
    unzip
    jetbrains.webstorm
    btop
    gzip
    cmake
  ];
}
