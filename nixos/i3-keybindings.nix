{ config, lib, pkgs, ... }:
let
  modifier = config.xsession.windowManager.i3.config.modifier;
in lib.mkOptionDefault {
  "${modifier}+l" = "exec i3lock";
  "Print" = "exec flameshot gui";
  "${modifier}+bracketleft" = "exec brightnessctl set 2%-";
  "${modifier}+bracketright" = "exec brightnessctl set 2%+";
}
