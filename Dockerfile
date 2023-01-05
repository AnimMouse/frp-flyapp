FROM alpine:latest
ENV VERSION 0.46.0
WORKDIR app/
RUN wget https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz && \
    tar -xf frp_${VERSION}_linux_amd64.tar.gz --strip-components 1 frp_${VERSION}_linux_amd64/frps && \
    rm frp_${VERSION}_linux_amd64.tar.gz
COPY frps.ini .
CMD ["/app/frps","-c","/app/frps.ini"]

EXPOSE 80/tcp
EXPOSE 443/tcp

# listener
EXPOSE 7000/udp

# p2p
EXPOSE 7001/udp

# satisfactory
EXPOSE 15000/udp
EXPOSE 15777/udp
EXPOSE 7777/udp

# vrising
EXPOSE 27015/udp
EXPOSE 27016/udp