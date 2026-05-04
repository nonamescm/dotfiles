{ config, dotfiles, ... }:
{
  home.file.".config/river/init" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nix/home-manager/modules/river/init";
    recursive = false;
  };
}
