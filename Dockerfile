FROM alpine:3
ENV VERSION 0.39.1
WORKDIR app/
RUN wget https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz && \
    tar -xf frp_${VERSION}_linux_amd64.tar.gz --strip-components 1 frp_${VERSION}_linux_amd64/frps && \
    rm frp_${VERSION}_linux_amd64.tar.gz
COPY frps.ini .
CMD ["/app/frps","-c","/app/frps.ini"]