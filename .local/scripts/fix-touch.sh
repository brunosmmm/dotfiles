#!/bin/bash

xinput --map-to-output $(xinput list --id-only "ELAN Touchscreen") eDP-1
xinput --map-to-output $(xinput list --id-only "Wacom ISDv4 EC Pen stylus") eDP-1

