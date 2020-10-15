#!/system/bin/sh

setenforce 0

# HACK: vel-shf.sh enabler for a20s
cd /vendor/bin
sh vel-shf.sh
