{...}: {
  programs.git = {
    enable = true;

    userName = "Elias Schlosser";
    userEmail = "CHANGE_ME@example.com";

    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        side-by-side = false;
      };
    };

    aliases = {
      s = "status --short --branch";
      l = "log --oneline --graph --decorate -20";
      la = "log --oneline --graph --decorate --all";
      last = "log -1 HEAD --stat";
      unstage = "restore --staged";
      amend = "commit --amend --no-edit";
    };

    ignores = [
      "result"
      "result-*"
      ".direnv/"
      ".DS_Store"
    ];

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      rebase.autoStash = true;
      fetch.prune = true;
      merge.conflictStyle = "zdiff3";
      diff.algorithm = "histogram";
      core.editor = "vim";
    };
  };
}
