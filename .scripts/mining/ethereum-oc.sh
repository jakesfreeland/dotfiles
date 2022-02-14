#!/bin/sh

# power limit
doas nvidia-smi -pl 130

# graphics offset
nvidia-settings -a "[gpu:0]/GPUGraphicsClockOffset[4]=-500"

# memory offset
nvidia-settings -a "[gpu:0]/GPUMemoryTransferRateOffset[4]=2000"
