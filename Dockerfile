FROM alpine:latest
ARG VERSION=0.53.0
WORKDIR app
RUN wget https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz && \
    tar -xf frp_${VERSION}_linux_amd64.tar.gz --strip-components 1 frp_${VERSION}_linux_amd64/frps && \
    rm frp_${VERSION}_linux_amd64.tar.gz
COPY frps.toml .
CMD ["/app/frps","-c","/app/frps.toml"]