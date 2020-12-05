#!/bin/bash
# Используя grep, проанализировать файл /var/log/syslog, отобрав события на своё усмотрение.

cd /var/log

cat syslog | grep -iP 'error|warn'

# Чтобы вывести 10 первых строчек:
cat syslog | grep -iP 'error|warn' | head
# Вывод:
# Nov 17 15:20:08 reima-VirtualBox kernel: [    0.672798] RAS: Correctable Errors collector initialized.
# Nov 17 15:20:08 reima-VirtualBox kernel: [    2.067139] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
# Nov 17 15:20:08 reima-VirtualBox kernel: [    2.242551] [drm:vmw_host_log [vmwgfx]] *ERROR* Failed to send host log message.
# Nov 17 15:20:08 reima-VirtualBox kernel: [    2.243616] [drm:vmw_host_log [vmwgfx]] *ERROR* Failed to send host log message.
# Nov 17 15:20:08 reima-VirtualBox systemd[1]: Condition check resulted in Process error reports when automatic reporting is enabled (file watch) being skipped.
# Nov 17 15:20:08 reima-VirtualBox thermald[487]: [WARN]NO RAPL sysfs present
# Nov 17 15:20:08 reima-VirtualBox thermald[487]: [WARN]20 CPUID levels; family:model:stepping 0x6:3d:4 (6:61:4)
# Nov 17 15:20:08 reima-VirtualBox thermald[487]: [WARN]Polling mode is enabled: 4
# Nov 17 15:20:08 reima-VirtualBox thermald[487]: [WARN]Thermal DTS: No coretemp sysfs found
# Nov 17 15:20:08 reima-VirtualBox thermald[487]: [WARN]sensor id 0 : No temp sysfs for reading raw temp