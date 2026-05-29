# My Ricing Fedora Sway

Minimal setup to daily use.

## Table of Contents
- [My Ricing Fedora Sway](#my-ricing-fedora-sway)
  - [Table of Contents](#table-of-contents)
    - [Setting Battery Threshold](#setting-battery-threshold)
    - [Optimizing](#optimizing)
      - [Suspend](#suspend)
      - [Setup ZRAM](#setup-zram)

### Setting Battery Threshold

```sh
sudo nano /etc/systemd/system/battery-threshold.service
```

```
[Unit]
Description=Set battery charge threshold

[Service]
Type=oneshot
ExecStart=/bin/bash -c 'echo 40 > /sys/class/power_supply/BAT0/charge_control_start_threshold'
ExecStart=/bin/bash -c 'echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold'

[Install]
WantedBy=multi-user.target
```

```
sudo systemctl enable --now battery-threshold.service
```

To check result configuration file:

```
cat /sys/class/power_supply/BAT0/charge_control_end_threshold
cat /sys/class/power_supply/BAT0/charge_control_start_threshold
```

### Optimizing

#### Suspend

```sh
cat /sys/power/mem_sleep

# expected output: [s2idle]
```

```sh
sudo nano /etc/default/grub

# Add GRUB_CMDLINE_LINUX="mem_sleep_default=s2idle ..."
```

```sh
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

Or if u use UEFI

```sh
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```

#### Setup ZRAM

``` sh
sudo nano /etc/systemd/zram-generator.conf
```

```ini
[zram0]
zram-size = ram * 1.5
compression-algorithm = zstd
```

