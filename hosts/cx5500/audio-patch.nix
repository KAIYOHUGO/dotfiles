{
  config,
}:
{
  services.pipewire.wireplumber.extraConfig.cx5500 = {
    # from
    # https://github.com/WeirdTreeThing/chromebook-linux-audio/blob/047550cc6c0b7fd161a5a3352972c512e11d67e3/conf/common/51-increase-headroom.conf
    "monitor.alsa.rules" = [
      {
        matches = [
          {
            "node.name" = "~alsa_output.*";
          }
        ];
        actions = {
          update-props = {
            "api.alsa.headroom" = "4096";
            # hide description
            "device.profile.description" = "";
          };
        };
      }

      # hide description
      {
        matches = [
          {
            "node.name" = "~alsa_input.*";
          }
        ];
        actions = {
          update-props = {
            "device.profile.description" = "";
          };
        };
      }

       # fix pro audio
      {
        matches = [
          {
            "alsa.card" = "0";
          }
        ];
        actions = {
          update-props = {
            "device.profile.pro" = "false";
          };

        };
      }

      # Speaker
      {
        matches = [
          {
            "node.name" = "alsa_output.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-output-0";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "Speaker";
            "node.description" = "Speaker";
          };

        };
      }

      # Headset
      {
        matches = [
          {
            "node.name" = "alsa_output.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-output-1";
          }
          {
            "node.name" = "alsa_input.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-input-1";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "Headset";
            "node.description" = "Headset";
          };

        };
      }

      # HDMI1
      {
        matches = [
          {
            "node.name" = "alsa_output.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-output-2";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "HDMI1";
            "node.description" = "HDMI1";
          };

        };
      }

      # HDMI2
      {
        matches = [
          {
            "node.name" = "alsa_output.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-output-3";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "HDMI2";
            "node.description" = "HDMI2";
          };

        };
      }

      # HDMI3
      {
        matches = [
          {
            "node.name" = "alsa_output.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-output-4";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "HDMI3";
            "node.description" = "HDMI3";
          };

        };
      }

      # HDMI4
      {
        matches = [
          {
            "node.name" = "alsa_output.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-output-5";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "HDMI4";
            "node.description" = "HDMI4";
          };

        };
      }

      # Microphone
      {
        matches = [
          {
            "node.name" = "alsa_input.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-input-99";
          }
        ];
        actions = {
          update-props = {
            "node.nick" = "Microphone";
            "node.description" = "Microphone";
          };

        };
      }

      # Broke Microphone?
      {
        matches = [
          {
            "node.name" = "alsa_input.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-input-100";
          }
          {
            "node.name" = "alsa_input.pci-0000_00_1f.3-platform-tgl_rt5682_def.pro-input-0";
          }
        ];
        actions = {
          update-props = {
            "node.disabled" = "true";
          };

        };
      }
    ];

  };

}
