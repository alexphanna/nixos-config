{
  services.home-assistant = {
    enable = false;
    config = {
      # Includes dependencies for a basic setup
      # https://www.home-assistant.io/integrations/default_config/
      default_config = {};
    };
    extraComponents = [
      "lg_thinq"
    ];
  };
}