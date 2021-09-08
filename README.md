# Go Jsonnet Docker image

Jsonnet container image based on alpine with [go-jsonnet](https://github.com/google/go-jsonnet) and various tools for CI.
Container image is built using the most recent version of go-jsonnet which hasn't been released yet.

## Usage

```bash
# usage of the recent functions in exec mode
docker run --rm dysnix/jsonnet -e '{ foo: std.parseYaml("hello: world") }'
```

```bash
# kube-prometheus example compilation (https://github.com/prometheus-operator/kube-prometheus)
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) dysnix/jsonnet jb update
docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u $(id -u):$(id -g) dysnix/jsonnet ./build.sh example.jsonnet

```
