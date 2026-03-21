{ pkgs, ... }:
{
  qt = {
    enable = true;
    style.package = with pkgs; [
      darkly-qt5
      darkly
    ];
    platformTheme.name = "qtct";
  };
}
