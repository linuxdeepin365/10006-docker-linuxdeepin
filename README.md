# docker-deepin-apricot-minimal [![Release Github Packages](https://github.com/antyung88/docker-deepin-minimal/actions/workflows/release.yml/badge.svg)](https://github.com/antyung88/docker-deepin-minimal/actions/workflows/release.yml)
Deepin Minimal Environment in Docker 

```
REPOSITORY                 TAG       IMAGE ID       CREATED         SIZE
ghcr.io/antyung88/deepin   apricot   7ea1be99f9e9   1 minute ago    530MB
```

# Usage

Pull Image
```
docker pull ghcr.io/antyung88/deepin:apricot
```

Run container in Docker
```
docker run -itd --name deepin_min ghcr.io/antyung88/deepin:minimal
docker exec -it deepin_min /bin/bash
```

Run container DIND
```
docker run -itd --name deepin_min -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/antyung88/deepin:apricot
```

Run as Base Image
```
FROM ghcr.io/antyung88/deepin:apricot
```
# LXC

```
+-----------+---------+----------------------+-----------------------------------------------+-----------+-----------+
|   NAME    |  STATE  |         IPV4         |                     IPV6                      |   TYPE    | SNAPSHOTS |
+-----------+---------+----------------------+-----------------------------------------------+-----------+-----------+
| deepin    | RUNNING | 10.93.193.251 (eth0) | fd42:93e6:850d:bb60:216:3eff:feb1:58c8 (eth0) | CONTAINER | 0         |
+-----------+---------+----------------------+-----------------------------------------------+-----------+-----------+
```

Export Image
```
sudo lxc-create deepin -t oci -- --url docker://ghcr.io/antyung88/deepin:apricot
```

Tar rootfs
```
cd /var/lib/lxc/deepin
sudo tar -cvzf rootfs.tar.gz -C rootfs .
```

Create Metadata
```
architecture: "x86_64"
creation_date: 1657169842 # To get current date in Unix time, use `date +%s` command
properties:
architecture: "x86_64"
description: "Deepin Minimal"
os: "debian"
release: "apricot"
```
```
sudo tar -cvzf metadata.tar.gz metadata.yaml
```

Import as LXC image
```
lxc image import metadata.tar.gz rootfs.tar.gz --alias deepin
```

Launch deepin in LXC
```
lxc launch deepin deepin
```

Configure ipv4
```
lxc exec deepin -- /bin/bash
echo "auto eth0" > /etc/network/interfaces
echo "iface eth0 inet dhcp" >> /etc/network/interfaces
touch /etc/fstab
ifup eth0
```

Fix systemctl

```
systemctl mask systemd-logind.service
systemctl mask systemd-journald-audit.socket
exit
```

## Priviliged Container 
```
lxc config edit deepin
```
Add the following lines under config
```
config:
  linux.kernel_modules: ip_tables,ip6_tables,netlink_diag,nf_nat,overlay
  raw.lxc: "lxc.apparmor.profile=unconfined\nlxc.cap.drop= \nlxc.cgroup.devices.allow=a\nlxc.mount.auto=proc:rw
    sys:rw"
  security.privileged: "true"
  security.nesting: "true"
```
```
lxc restart deepin
```
```
lxc exec deepin -- /bin/bash
apt update
apt install apt-transport-https ca-certificates curl software-properties-common
apt install docker-ce
```
