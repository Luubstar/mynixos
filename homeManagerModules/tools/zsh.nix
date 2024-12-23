{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      rebuild = "~/rebuild.sh";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
      ];
      theme = "gnzh";
    };
  };
}
