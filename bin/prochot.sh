#!/bin/sh

modprobe msr
wrmsr -a 0x1FC 262236
