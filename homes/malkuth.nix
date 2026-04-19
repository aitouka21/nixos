{ pkgs, lib, ... }: {
  home.username = "malkuth";
  home.homeDirectory = "/home/malkuth";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    htop tree mpv
  ];

  imports = [
    ../packages/alacritty.nix
    ../packages/bash.nix
    ../packages/fcitx.nix
    ../packages/git.nix
    ../packages/nushell.nix
    ../packages/sway.nix
    ../packages/tmux.nix
    ../packages/waybar.nix
    ../packages/wofi.nix
    ../packages/zoxide.nix
    ../packages/zsh.nix
  ];

}
