{
  services.qbittorrent = {
    enable = true;
    serverConfig = {
      BitTorrent.Session = {
        Interface = "proton0";
        InterfaceName = "proton0";
      };
      LegalNotice.Accepted = true;
    };
  };
}