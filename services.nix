{
  pkgs,
  ...
}:

{
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  environment.systemPackages = [ pkgs.wl-clipboard ];

  services.udisks2.enable = true;
  services.keyd = {
    enable = false;
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
  virtualisation.docker.enable = true;
  services.openssh.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
}
