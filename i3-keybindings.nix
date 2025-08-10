{ config, lib, pkgs, ... }:
let
  modifier = config.xsession.windowManager.i3.config.modifier;
in lib.mkOptionDefault {
  "${modifier}+m" = "exec i3lock";
  "Print" = "exec flameshot gui";
  "${modifier}+bracketleft" = "exec brightnessctl set 2%-";
  "${modifier}+bracketright" = "exec brightnessctl set 2%+";
  "${modifier}+j" = "focus down";
  "${modifier}+h" = "focus left";
  "${modifier}+l" = "focus right";
  "${modifier}+k" = "focus up";
  "${modifier}+Shift+j" = "move down";
  "${modifier}+Shift+h" = "move left";
  "${modifier}+Shift+l" = "move right";
  "${modifier}+Shift+k" = "move up";
}
