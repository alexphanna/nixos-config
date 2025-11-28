{
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Experimental = true; # Show battery charge of Bluetooth devices
        DiscoverableTimeout = "0"; # Always discoverable
      };
    };
  };
  
  services.blueman.enable = true;
}