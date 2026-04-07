{ ... }: {
  programs.nushell = {
    enable = true;

    settings = {
      edit_mode = "vi";
    };

    shellAliases = import ../common/shell_aliases.nix;
  };
}
