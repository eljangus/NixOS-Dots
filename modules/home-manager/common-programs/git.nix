{...}: {
  programs.git = {
    enable = true;
    

    settings = {
      user = {
        name = "Elias Schlosser";
        email = "eljangus@example.com";
      };
    init.defaultBranch = "main";
  };
}
