{...}: {
  programs.git = {
    enable = true;

    settings.user = {
      email = "Elias Schlosser";
      name = "eljangus@example.com";
      core.editor = "nvim";
      init.defaultBranch = "main";
    };
  };
}
