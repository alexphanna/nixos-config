{ pkgs, username, ... }:
{
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd.enable = true;
  systemd.services."libvirtd".path = [ pkgs.passt ];
  users.users.${username}.extraGroups = [
    "libvirtd"
    "kvm"
  ];

  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm ignore_msrs=1 report_ignored_msrs=0 
  '';

  environment.systemPackages = with pkgs; [
    qemu_kvm
  ];
}
