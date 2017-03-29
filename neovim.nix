{ config, pkgs, ... }:

{
  environment.systemPackages = [ (pkgs.neovim.override {
    vimAlias = true;
    configure.vam.knownPlugins = pkgs.vimPlugins;
    configure.vam.pluginDictionaries = [{ names =
      [ "ctrlp"
        "syntastic"
        "vim-polyglot"
        "youcompleteme"
      ];
    }];
  }) ];
}
