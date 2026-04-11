{ pkgs, ...}:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "aitouka21";
        email = "wscheungae@gmail.com";
      };
      init.defaultBranch = "main";
    };

    ignores = [ "*.swp" "node_modules" ];
  };
}
