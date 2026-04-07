{ ... }: {
  programs.bash = {
    enable = true;
  
    enableCompletion = true;
  
    shellAliases = import ../common/shell_aliases.nix;
  };
}
