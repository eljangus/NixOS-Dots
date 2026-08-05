{...}: {
  programs.git = {
    enable = true;

    userName = "Elias Schlosser";
    userEmail = "eljangus@example.com";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "vim";
    };
  };
}
