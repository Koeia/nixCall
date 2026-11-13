{ pkgs, lib, ... }:
let
  pluginPath =
    format:
    lib.concatStringsSep ":" [
      "$HOME/.${format}"
      "/etc/profiles/per-user/$USER/lib/${format}"
      "/run/current-system/sw/lib/${format}"
    ];
in
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  users.users.jctannu4.extraGroups = [ "audio" ];
  security.pam.loginLimits = [
    {
      domain = "@audio";
      item = "memlock";
      type = "-";
      value = "unlimited";
    }
    {
      domain = "@audio";
      item = "rtprio";
      type = "-";
      value = "95";
    }
  ];

  environment.systemPackages = with pkgs; [
    (reaper.override { jackLibrary = pipewire.jack; })

    yabridge
    yabridgectl
    wineWow64Packages.yabridge

    lsp-plugins
    x42-plugins
    airwindows-lv2
    dragonfly-reverb

    qpwgraph
    carla
    bottles
  ];

  environment.variables = {
    LV2_PATH = pluginPath "lv2";
    VST3_PATH = pluginPath "vst3";
    CLAP_PATH = pluginPath "clap";
    VST_PATH = pluginPath "vst";
  };
}
