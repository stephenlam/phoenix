{ config, pkgs, ... }:

{
  environment.systemPackages = [ (pkgs.neovim.override {
    vimAlias = true;
    configure.vam.knownPlugins = pkgs.vimPlugins;
    configure.vam.pluginDictionaries = [{ names =
      [ "ctrlp"
        "neomake"
        "vim-polyglot"
        "youcompleteme"
      ];
    }];
  }) ];
}
