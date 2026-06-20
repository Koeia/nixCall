{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    android-tools
    nmap
    wireshark-cli
		jetbrains.gateway
    unzip
    btop
    gzip
  ];
}
