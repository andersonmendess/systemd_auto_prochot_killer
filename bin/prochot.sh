#!/bin/sh

# Prochot killer
modprobe msr
rdmsr -ad 0x1FC
wrmsr -a 0x1FC 262236

# lock min cpu clock with intel pstate
echo 75 > /sys/devices/system/cpu/intel_pstate/min_perf_pct
