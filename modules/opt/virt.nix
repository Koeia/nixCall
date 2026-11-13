{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true; # emulated TPM, needed for Windows 11
  };
  programs.virt-manager.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  users.users.jctannu4.extraGroups = [ "libvirtd" ];

  networking.firewall.trustedInterfaces = [ "virbr0" ];

  environment.systemPackages = [ pkgs.virt-viewer ];
}
