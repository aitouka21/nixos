{ ... }:
{
  programs.zoxide = {
    enable = true;
  
    options = [
      "--cmd j"
    ];
  
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
  };
}
