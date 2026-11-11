{
  imports = [
    ./hardware-configuration.nix
    ../../modules/opt/plasma.nix
    ../../modules/opt/gaming.nix
    ../../modules/common
  ];
  networking.hostName = "nixDesk";
  system.stateVersion = "26.05";
}
