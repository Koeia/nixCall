{
  imports = [
    ./hardware-configuration.nix
    ../../modules/opt/plasma.nix
    ../../modules/opt/gaming.nix
  ];
  networking.hostName = "nixDesk";
  hardware.amdgpu.initrd.enable = true;
  services.lact.enable = true;
  system.stateVersion = "26.05";
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
          };
        };
      };
    };
  };
}
