{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];
  networking.hostName = "nixCall";
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  environment.systemPackages = [ pkgs.brightnessctl ];
  system.stateVersion = "26.05";
}
