let
  pkgs = import <nixpkgs> { };
  themeName = "McMojave Cursors";
  mcmojave = pkgs.stdenv.mkDerivation {
    name = "mcmojave-cursors";
    src = builtins.fetchGit {
      url = "https://github.com/vinceliuice/McMojave-cursors/";
    };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/icons/
      cp -r ./dist/. "$out/share/icons/${themeName}"
    '';
  };
in
{ pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    package = mcmojave;
    name = "McMojave Cursors";
    size = 10;
  };
}
