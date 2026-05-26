{
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    udisks2.enable = true;
    devmon.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      displayManager.startx.enable = true;
    };
    displayManager.defaultSession = "none+i3";
    udev.extraRules = ''
      SUBSYSTEM=="input", ATTRS{idVendor}=="3233", ATTRS{idProduct}=="5311", ENV{ID_INPUT_JOYSTICK}=""
    '';
  };
}
