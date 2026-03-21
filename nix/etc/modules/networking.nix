{ ... }:
{
  networking.modemmanager.enable = false;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Sao_Paulo";
}
