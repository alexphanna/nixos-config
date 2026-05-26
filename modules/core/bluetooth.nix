{
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
        ControllerMode = "bredr"; # Required to make dualsense controller connect properly
        FastConnectable = true;
        JustWorksRepairing = "always";
      };
    };
  };

  services.blueman.enable = true;
}
