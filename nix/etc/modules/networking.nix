{ ... }:
{
  networking.modemmanager.enable = false;
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/Sao_Paulo";

  services.pppd.enable = true;
  boot.kernelModules = [
    "nf_conntrack_pptp"
    "nf_nat_pptp"
  ];
  networking.firewall.extraCommands = ''
    iptables -A INPUT -p gre -j ACCEPT
    iptables -A OUTPUT -p gre -j ACCEPT
    iptables -t raw -A OUTPUT -p tcp --dport 1723 -j CT --helper pptp
  '';
}
