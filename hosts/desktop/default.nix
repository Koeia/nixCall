{
  imports = [
    ./hardware-configuration.nix
    ../../modules/opt/plasma.nix
    ../../modules/opt/gaming.nix
    ../../modules/common
  ];
  networking.hostName = "nixDesk";
  hardware.amdgpu.initrd.enable = true;
  hardware.graphics.enable32bit = true;
  services.lact.enable = true;
  system.stateVersion = "26.05";
}
