{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        useGrimAdapter = true;
        disabledGrimWarning = true;
        drawColor = "#ff0000";
        savePath = "/home/noname/Downloads";
      };
    };
  };
}
