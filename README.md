# what

1. docker linuxdeepin


# why

1. run and test linuxdeepin in docker



# how






# 10006-docker-deepin-apricot-minimal [![Release Github Packages](https://github.com/linuxdeepin365/10006-docker-deepin-apricot-minimal/actions/workflows/release.yml/badge.svg)](https://github.com/linuxdeepin365/10006-docker-deepin-apricot-minimal/actions/workflows/release.yml)
Deepin Minimal Environment in Docker 


```
REPOSITORY                                                           TAG       IMAGE ID       CREATED         SIZE
ghcr.io/linuxdeepin365/10006-docker-deepin-apricot-minimal:apricot   apricot   7ea1be99f9e9   1 minute ago    184MB
```

# Usage

Pull Image
```
docker pull ghcr.io/linuxdeepin365/10006-docker-deepin-apricot-minimal:apricot
```

Run container in Docker
```
docker run -itd --name deepin_min ghcr.io/linuxdeepin365/10006-docker-deepin-apricot-minimal:apricot
docker exec -it deepin_min /bin/bash
```

Run container DIND
```
docker run -itd --name deepin_min -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/linuxdeepin365/10006-docker-deepin-apricot-minimal:apricot
```

Run as Base Image
```
FROM ghcr.io/linuxdeepin365/10006-docker-deepin-apricot-minimal:apricot
```

