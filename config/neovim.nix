{ pkgs, ... }:


{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;


    coc = {
      enable = true;
    };

    extraLuaConfig = "
      vim.o.number = true \n
      vim.o.smartindent = true \n
      vim.o.cursorline = true \n


      vim.keymap.set('n', 'j', 'gj')
      vim.keymap.set('i', 'jj', '<ESC>')
    ";


    plugins = with pkgs.vimPlugins; [
      vim-nix
      indentLine

      # colorscheme
      { plugin = nightfox-nvim;
        config = "colorscheme nightfox";
      }

      # start screen
      { plugin = vim-startify;
	config = "let g:startify_change_to_vcs_root = 0";
      }
    ];
  };
}
