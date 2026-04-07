{ pkgs, ... }: 
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  
    shellAliases = import ../common/shell_aliases.nix;
  
    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
    };
  
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "refined"; # Or your preferred theme
    };
  };
}
