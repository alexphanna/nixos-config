{ pkgs, ... }:
{
  programs.virt-manager.enable = true;

  environment = {
    systemPackages = with pkgs; [
      qemu_kvm
      virt-viewer
    ];
  };
}
