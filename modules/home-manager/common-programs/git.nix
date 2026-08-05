{...}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Elias Schlosser";
        email = "eljangus@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
