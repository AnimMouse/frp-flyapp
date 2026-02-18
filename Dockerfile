FROM golang:alpine as build
RUN apk add --no-cache patch make nodejs npm
WORKDIR frp
ARG VERSION=0.67.0
RUN wget -qO- https://github.com/fatedier/frp/archive/refs/tags/v${VERSION}.tar.gz | tar -xz --strip-components 1
ADD patches patches
RUN patch -p1 < patches/udp-proxy-fly-global-services.patch
RUN patch -p1 < patches/kcp-quic-fly-global-services.patch
RUN cd web/frps && npm install && npm run build
RUN make frps

FROM alpine:latest
WORKDIR app
COPY --from=build /go/frp/bin/frps .
COPY frps.toml .
CMD ["/app/frps","-c","/app/frps.toml"]