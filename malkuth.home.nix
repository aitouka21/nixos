{ pkgs, lib, ... }: {
  home.username = "malkuth";
  home.homeDirectory = "/home/malkuth";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    htop tree
  ];

  imports = [
    ./packages/alacritty.nix
    ./packages/bash.nix
    ./packages/nushell.nix
    ./packages/sway.nix
    ./packages/tmux.nix
    ./packages/waybar.nix
    ./packages/zoxide.nix
    ./packages/zsh.nix
  ];

}
