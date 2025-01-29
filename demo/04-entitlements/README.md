```shell
# show target with attributes that could potentially be harmfulwith privileged operations 
docker buildx bake binary --print
# try to build
docker buildx bake binary
# allow fs
docker buildx bake binary --allow fs=*
# disable entitlements
BUILDX_BAKE_ENTITLEMENTS_FS=0 docker buildx bake binary
```
