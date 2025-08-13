let
  laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBLi9Eo9OYynGB2yXa8HOdtFyHNhNMtb+bRFxyyeVKPH";
  desktop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGyF0LMEJF0IkgLmHl0tUtv8BTH7oROOA3JMepqMqRIy";
  users = [ laptop desktop ];
in
{
  "secret1.age".publicKeys = [ laptop ];
  "secret2.age".publicKeys = [ desktop ];
}