{ pkgs, ... }:
{
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    wireplumber.extraConfig."10-bluez" = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-hw-volume" = [ ];
        "bluez5.backend" = "native";
      };
      "monitor.bluez.roles" = {
        "bluez5.roles" = [
          "a2dp_sink"
          "a2dp_source"
        ];
      };
    };
    wireplumber.configPackages = [
      (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/11-bluetooth-policy.conf" ''
        wireplumber.settings = { bluetooth.autoswitch-to-headset-profile = false }
      '')
    ];
  };
}
