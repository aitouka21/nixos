{ pkgs, lib, ... } :

let
  background-package = pkgs.runCommand "background-image" {} ''
    cp ${../wallpapers/ba2.jpg} $out
  '';
in
{

  home.packages = with pkgs; [
    swayidle
    swaylock
    swaybg
    waybar
    mako
    grim
    slurp
    wl-clipboard
  ];

  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";
      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];
      output = {
        "*" = {
	  bg = "${background-package} fill";
	};
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+c" = "kill";
	"${modifier}+p" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.wl-clipboard}/bin/wl-copy";
      };
    };
  };
}
