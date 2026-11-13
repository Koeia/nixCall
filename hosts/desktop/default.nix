{
  imports = [
    ./hardware-configuration.nix
    ../../modules/opt/plasma.nix
    ../../modules/opt/audio.nix
    ../../modules/opt/virt.nix
    ../../modules/opt/gaming.nix
  ];
  networking.hostName = "nixDesk";
  hardware.amdgpu.initrd.enable = true;
  services.lact.enable = true;
  
	system.stateVersion = "26.05";
	
	services.openssh = {
	  enable = true;
	  openFirewall = false;
	  settings = {
	    PasswordAuthentication = false;
	    PermitRootLogin = "no";
		 };
	};
	networking.firewall.trustedInterfaces = [ "tailscale0" ];

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
