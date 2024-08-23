{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rytst";
  home.homeDirectory = "/home/rytst";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.neofetch
    pkgs.btop
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };


  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 7;
      };
      window = {
        opacity = 0.8;
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "rytst";
    userEmail = "r.saito0111@gmail.com";
  };

  programs.firefox = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true; 
  };


  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      terminal = "alacritty";
      modifier = "Mod4";
      gaps = {
        inner = 0;
        outer = 0;
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
