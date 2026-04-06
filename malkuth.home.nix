{ pkgs, ... }: {
  home.username = "malkuth";
  home.homeDirectory = "/home/malkuth";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    htop
  ];

  programs.bash.enable = true;

  programs.alacritty = import ./packages/alacritty.nix {};
}
