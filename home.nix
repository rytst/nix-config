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
        size = 11.5;
      };
      window = {
        opacity = 0.5;
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

  programs.wofi = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;
    # The hyprland package to use
    package = pkgs.hyprland;
    # Whether to enable XWayland
    xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;

    settings = {

      decoration = {
        rounding = 10;

	active_opacity = 0.8;
	inactive_opacity = 0.7;
      };


      general = {
        gaps_in = 5;
	gaps_out = 5;

	border_size = 2;
      };


      "$mod" = "SUPER";
      bind =
        [
	  "$mod, RETURN, exec, alacritty"
	  "$mod, F, exec, firefox"
	  "$mod, R, exec, wofi --show drun"
	  "$mod, Q, killactive"

          "$mod, H, movefocus, l"
	  "$mod, J, movefocus, d"
	  "$mod, K, movefocus, u"
	  "$mod, L, movefocus, r"

	  ", Print, exec, grimblast copy area"
	]
	++ (
	  # workspaces
	  # binds $mod + [shift +] {1..10} [to move] workspace {1..10}
	  builtins.concatLists (builtins.genList (
	    x: let
	      ws = let
	        c = (x + 1) / 10;
	      in
	        builtins.toString (x + 1 - (c * 10));
	    in [
	      "$mod, ${ws}, workspace, ${toString (x + 1)}"
	      "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
	    ]
	  )
	  10)
	);

      monitor = [
        ", preferred, auto, 1"
      ];
    };
  };


  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  # };

  # xsession.windowManager.i3 = {
  #   enable = true;
  #   package = pkgs.i3-gaps;
  #   config = {
  #     terminal = "alacritty";
  #     modifier = "Mod4";
  #     gaps = {
  #       inner = 0;
  #       outer = 0;
  #     };
  #     bars = [
  #       {
  #         position = "top";
  #         statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
  #       }
  #     ];
  #   };
  # };


  # programs.i3status-rust = {
  #   enable = true;
  #   bars = {
  #     top = {
  #       blocks = [
  #        {
  #          block = "time";
  #          interval = 60;
  #          format = " $timestamp.datetime(f:'%a %m/%d %y %R') ";
  #        }
  #      ];
  #     };
  #   };
  # };

  services.mako = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
