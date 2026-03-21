{ pkgs, ... }:
{
  users.users.noname = {
    isNormalUser = true;
    description = "Alice Menezes";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
    ];
    shell = pkgs.zsh;
  };
}
