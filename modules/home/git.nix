{
programs.git = {
    enable = true;
    userName  = "Alex Hanna";
    userEmail = "ahanna0608@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}