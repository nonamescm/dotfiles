{ config, dotfiles, ... }:
{
  home.file.".config/river" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nix/home-manager/modules/river";
    recursive = false;
  };
}
