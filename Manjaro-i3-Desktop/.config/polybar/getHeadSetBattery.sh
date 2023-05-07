#!/bin/bash

pactl list cards | grep bluetooth.battery | sed "s/bluetooth.battery = \"//" | sed "s/\"//"
