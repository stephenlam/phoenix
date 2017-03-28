{ config, pkgs, ... }:

pkgs.vim_configurable.customize {
  name = "vim-with-plugins";

  vimrcConfig.vam.knownPlugins = pkgs.vimPlugins;
  vimrcConfig.vam.pluginDictionaries = [{ names =
    [ "ctrlp"
    , "syntastic"
    , "vim-polyglot"
    , "youcompleteme"
    , "ateliercave"
    ];
  }];
};
