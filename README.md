# docker-deepin-minimal
Deepin Minimal Environment in Docker 

```
REPOSITORY                 TAG       IMAGE ID       CREATED         SIZE
ghcr.io/antyung88/deepin   minimal   7ea1be99f9e9   1 minute ago    504MB
```

# Usage

Pull Image
```
docker pull ghcr.io/antyung88/deepin:minimal
```

Run container in Docker
```
docker run -itd --name deepin_min ghcr.io/antyung88/deepin:minimal
docker exec -it deepin_min /bin/bash
```

Run container DIND
```
docker run -itd --name deepin_min -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/antyung88/deepin:minimal
```

Run as Base Image
```
FROM ghcr.io/antyung88/deepin:minimal
```
