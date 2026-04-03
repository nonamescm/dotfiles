{ pkgs, inputs, ... }:
let
  themeName = "McMojave Cursors";
  mcmojave = pkgs.stdenv.mkDerivation {
    pname = "mcmojave-cursors";
    version = "unstable";
    src = inputs.mcmojave-src;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/icons/
      cp -r ./dist/. "$out/share/icons/${themeName}"
    '';
  };
in
{
  home.pointerCursor = {
    gtk.enable = true;
    package = mcmojave;
    name = "McMojave Cursors";
    size = 10;
  };
}
