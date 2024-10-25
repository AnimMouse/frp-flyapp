FROM golang:alpine as build
RUN apk add --no-cache patch
WORKDIR frp
ARG VERSION=0.61.0
RUN wget -qO- https://github.com/fatedier/frp/archive/refs/tags/v${VERSION}.tar.gz | tar -xz --strip-components 1
ADD patches patches
RUN patch -p1 < patches/udp-proxy-fly-global-services.patch
RUN patch -p1 < patches/kcp-quic-fly-global-services.patch
RUN CGO_ENABLED=0 go install ./cmd/frps

FROM alpine:latest
WORKDIR app
COPY --from=build /go/bin/frps .
COPY frps.toml .
CMD ["/app/frps","-c","/app/frps.toml"]