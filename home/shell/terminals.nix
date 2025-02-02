{ pkgs, ... }:

# terminals

let
  font = "FiraCode Nerd Font";
in
{

  programs.kitty = {
    enable = true;
    font = {
      name = font;
      size = 14;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };

#   programs.ghostty = {
#     enable = true;
#     installBatSyntax = true;
#     installVimSyntax = true;
#     settings = {
#       theme = "catppuccin-mocha";
#       font-family = font;
#       font-size = 10;
#     };
#   };


#   programs.alacritty = {
#     enable = true;
#     settings = {
#       window.opacity = 0.95;
#       window.dynamic_padding = true;
#       window.padding = {
#         x = 5;
#         y = 5;
#       };
#       font = {
#         normal.family = font;
#         bold.family = font;
#         italic.family = font;
#       };
#       selection.save_to_clipboard = true;
#     };
#   };
}
