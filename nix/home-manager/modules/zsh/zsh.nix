{ config, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    autocd = true;
    defaultKeymap = "emacs";

    initContent = builtins.readFile ./zshrc;

    shellAliases = {
      sudo = "sudo ";
      doas = "sudo ";
      vim = "nvim";
      vi = "nvim";
      cl = "clear";
      ls = "ls --color=auto";
      l = "ls -lAh";
      la = "ls -lah";
      ll = "ls -lh";
      lq = "ls -A --quoting-style=shell-always";
      rm = "rm -i";
      mv = "mv -i";
      cp = "cp -i";
      ":q" = "exit";
    };
  };
}
