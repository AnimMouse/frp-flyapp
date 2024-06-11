FROM alpine:latest
ENV VERSION 0.58.1
WORKDIR /app/
COPY frps /app/frps
COPY frps.toml .
CMD ["/app/frps","-c","/app/frps.toml"]

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
