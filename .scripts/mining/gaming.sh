#!/bin/sh

# power limit
doas nvidia-smi -pl 220

# graphics offset
nvidia-settings -a "[gpu:0]/GPUGraphicsClockOffset[4]=0"

# memory offset
nvidia-settings -a "[gpu:0]/GPUMemoryTransferRateOffset[4]=0"
