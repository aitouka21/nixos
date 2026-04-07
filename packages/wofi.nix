{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    # Keep your settings block as it was (width, height, etc.)

    # Updated, readable style block
    style = ''
      * {
        font-family: "Input Mono Compressed", monospace;
        font-size: 13px;
        /* Default text color for everything (the search box, entries) */
        color: #cdd6f4;
      }

      window {
        margin: 0px;
        border: none;
        background-color: #1e1e2e;
        border-radius: 0px; /* Remove rounded corners */
      }

      #input {
        margin: 5px;
        border: none;
        background-color: #313244;
        /* Placeholder/Search text color */
        color: #cba6f7;
      }

      #inner-box {
        margin: 5px;
        background-color: #1e1e2e;
      }

      /* Non-selected list items - significantly brighter */
      #entry {
        color: #bac2de; 
      }

      /* Selected list item - The highlighted pinky-purple entry */
      #entry:selected {
        background-color: #cba6f7;
        color: #11111b; /* Reverse the text color when selected for contrast */
        border-radius: 0px;
      }

      #text:selected {
        color: #11111b; /* Ensure text matches the foreground color of selected entry */
      }
    '';
  };
}
