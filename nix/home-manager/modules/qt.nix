{ pkgs, ... }:
{
  qt = {
    enable = true;
    style.package = [
      pkgs.adwaita-qt
      pkgs.adwaita-qt6
    ];
    platformTheme.name = "qtct";
  };
}
