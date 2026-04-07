{ pkgs, ... }: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";

    fcitx5 = {
      settings = {
        globalOptions = {
          "Hotkey/NextKey" = {
            "0" = "Control+Super+space";
          };
        };

	# BUG? not working
        # inputMethod = {
        #   GroupOrder."0" = "Default";
        #   "Groups/0" = {
        #     Name = "Default";
        #     "Default Layout" = "us";
        #     DefaultIM = "pinyin";
        #   };
        #   "Groups/0/Items/0".Name = "keyboard-us";
        #   "Groups/0/Items/1".Name = "pinyin";
        # };
      };
      addons = with pkgs; [
        qt6Packages.fcitx5-chinese-addons
        fcitx5-table-extra
        fcitx5-mozc
        fcitx5-gtk
        fcitx5-lua
        catppuccin-fcitx5
      ];
    };
  };

 home.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Force Electron/Chrome apps to use Wayland
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
  
  home.file.".config/fcitx5/profile".text = ''
    [Groups/0]
    Name=Default
    Default Layout=us
    DefaultIM=keyboard-us

    [Groups/0/Items/0]
    Name=keyboard-us
    Layout=

    [Groups/0/Items/1]
    Name=quick-classic
    Layout=

    [Groups/0/Items/2]
    Name=mozc
    Layout=

    [GroupOrder]
    0=Default
  '';

  home.file.".config/fcitx5/config".text = ''
    [Hotkey/TriggerKeys]
    0=Control+Super+space
  '';

  home.file.".config/fcitx5/conf/classicui.conf".text = ''
    Vertical Candidate List=True
    Theme=catppuccin-mocha-mauve
    Font="Input Mono Compressed 12"
    TrayFont="Input Mono Compressed 12"
  '';
}
