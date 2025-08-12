let
  user = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBLi9Eo9OYynGB2yXa8HOdtFyHNhNMtb+bRFxyyeVKPH";
  users = [ user ];
in
{
  "secret1.age".publicKeys = [ user ];
}