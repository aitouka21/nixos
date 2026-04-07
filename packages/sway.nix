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
      menu = "${pkgs.wofi}/bin/wofi --show drun";

      gaps = {
        inner = 4;
	outer = 4;
      };

      colors = {
        focused = {
          border = "#cba6f7";
          background = "#cba6f7";
          text = "#11111b";
          indicator = "#f5c2e7";
          childBorder = "#cba6f7";
        };
      };

      window = {
        titlebar = false;
	border = 2;
      };

      bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];

      startup = [{ command = "fcitx5 -d --replace"; }];

      output = {
        "*" = {
	  bg = "${background-package} fill";
	};
      };

      keybindings = lib.mkOptionDefault {
        "${modifier}+c" = "kill";
	"${modifier}+p" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.wl-clipboard}/bin/wl-copy";
	"${modifier}+Shift+q" = "exit";
      };
    };
  };
}
