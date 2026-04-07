{...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
        # opacity = 0.9;
      };
      font = {
        size = 11;
        normal.family = "Input Mono Compressed";
        bold.family = "Input Mono Compressed";
        italic.family = "Input Mono Compressed";
        bold_italic.family = "Input Mono Compressed";
      };
      colors = {
        primary = {
          background = "#171719";
          foreground = "#A0A0AF";
        };

        # Uncomment if you want to use the cursor colors from the theme
        # cursor = {
        #   text = "#171719";
        #   cursor = "#A0A0AF";
        # };

        normal = {
          black   = "#1F1F21";
          red     = "#A67E97";
          green   = "#738980";
          yellow  = "#A68170";
          blue    = "#6C81B8";
          magenta = "#6E6DA7";
          cyan    = "#55787D";
          white   = "#606069";
        };

        bright = {
          black   = "#61616A";
          red     = "#cf9dbd";
          green   = "#90aba0";
          yellow  = "#cfa18c";
          blue    = "#87a1e6";
          magenta = "#8a88d1";
          cyan    = "#6a969c";
          white   = "#A0A0AF";
        };
      };
    };
  };
}
