{
  pkgs,
  ...
}:

{
  virtualisation.waydroid.enable = true;
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
  environment.systemPackages = [ pkgs.wl-clipboard ];

  services.udisks2.enable = true;
  virtualisation.docker.enable = true;
  security.polkit.enable = true;
}
