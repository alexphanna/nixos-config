{
  services.qbittorrent = {
    enable = false;
    serverConfig = {
      BitTorrent.Session = {
        Interface = "proton0";
        InterfaceName = "proton0";
      };
      LegalNotice.Accepted = true;
    };
  };
}