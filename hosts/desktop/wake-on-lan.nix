{
  boot = {
    initrd.availableKernelModules = [ "r8169" ];
  };
  networking.interfaces."enp42s0".wakeOnLan.enable = true;
}
