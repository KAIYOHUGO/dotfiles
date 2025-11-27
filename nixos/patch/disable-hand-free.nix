{
  config,
}:
{
  services.pipewire.wireplumber.extraConfig.disable-hand-free = {
    "monitor.bluez.properties" = {
      ## Enabled roles (default: [ a2dp_sink a2dp_source bap_sink bap_source hfp_hf hfp_ag ])
      ##
      ## Currently some headsets (Sony WH-1000XM3) are not working with
      ## both hsp_ag and hfp_ag enabled, so by default we enable only HFP.
      ##
      ## Supported roles: hsp_hs (HSP Headset),
      ##                  hsp_ag (HSP Audio Gateway),
      ##                  hfp_hf (HFP Hands-Free),
      ##                  hfp_ag (HFP Audio Gateway)
      ##                  a2dp_sink (A2DP Audio Sink)
      ##                  a2dp_source (A2DP Audio Source)
      ##                  bap_sink (LE Audio Basic Audio Profile Sink)
      ##                  bap_source (LE Audio Basic Audio Profile Source)
      ## --
      ## Only enable A2DP here and disable HFP. See note at the top as to why.
      "bluez5.roles" = [
        "a2dp_sink"
        "a2dp_source"
        "bap_sink"
        "bap_source"
      ];
    };
  };
}
