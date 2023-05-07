#!/bin/bash

lang=$(dbus-send --session --print-reply --dest=org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1.CurrentInputMethod | grep -Po '(?<=")[^"]+')
  if [ $lang == "chewing" ]; then
    echo "%{T1}中%{T-}"
  else
    echo "%{T1}英%{T-}"
  fi