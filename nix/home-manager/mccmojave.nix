let
  pkgs = import <nixpkgs> {};
  themeName = "McMojave Cursors";
in
pkgs.stdenv.mkDerivation {
  name = "mccmojave-cursors";
  src = builtins.fetchGit {
    url = https://github.com/vinceliuice/McMojave-cursors/;
  };
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/icons/
    cp -r ./dist/. "$out/share/icons/${themeName}"
  '';
}
