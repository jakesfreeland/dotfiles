#!/bin/sh

rclone sync -v $HOME/.config/rclone google-drive:/File\ Backup/.config/rclone
rclone sync -v $HOME/Documents google-drive:/File\ Backup/Documents
rclone sync -v $HOME/Media google-drive:/File\ Backup/Media
