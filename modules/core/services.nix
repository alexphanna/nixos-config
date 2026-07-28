{
  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
    udisks2.enable = true;
    devmon.enable = true;
    fstrim.enable = true;
    openssh.enable = true;
    # may be causing weird issues
    udev.extraRules = ''
      SUBSYSTEM=="input", ATTRS{idVendor}=="3233", ATTRS{idProduct}=="5311", ENV{ID_INPUT_JOYSTICK}=""
    '';
  };
}
