```shell
# list targets
docker buildx bake --list=targets
# print all targets (useful for migrating from csv values to composable attributes)
docker buildx bake build push binary --print
```
