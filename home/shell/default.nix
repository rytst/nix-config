{config, ...}:

{
  imports = [
#    ./nushell
#    ./common.nix
    ./starship.nix
    ./terminals.nix
  ];

  # add environment variables
  home.sessionVariables = {

    # set default applications
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";

    # MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };

  home.shellAliases = {
    k = "kubectl";
  };
}
