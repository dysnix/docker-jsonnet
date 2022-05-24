
FROM golang:1.18-alpine AS builder

ENV GO111MODULE=on
RUN apk --no-cache add git && \
    go install -v github.com/jsonnet-bundler/jsonnet-bundler/cmd/jb@v0.4.0 && \
    go install -v github.com/google/go-jsonnet/cmd/jsonnet@c187d5b && \
    go install -v github.com/brancz/gojsontoyaml@latest

FROM alpine:latest
RUN apk --no-cache add git bash make jq gawk ca-certificates curl wget

COPY --from=builder /go/bin/* /usr/local/bin/
COPY ./entrypoint.sh /
RUN chmod a+x /usr/local/bin/jb /usr/local/bin/jsonnet /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "--help" ]
