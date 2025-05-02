#!/bin/bash
set -e

echo "Cleaning up system..."

sudo nala autoremove -y
sudo nala clean
sudo journalctl --vacuum-time=7d

echo "System cleanup completed."
