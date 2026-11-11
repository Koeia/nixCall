{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    protontricks.enable = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
