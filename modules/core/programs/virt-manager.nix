{ pkgs, ... }:
{
    programs.virt-manager.enable = true;

    environment = {
        systemPackages = [ pkgs.qemu_kvm ];
    };
}