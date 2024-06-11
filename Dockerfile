FROM alpine:latest
ENV VERSION 0.58.1
WORKDIR /app/
#RUN apk add go git && git clone https://github.com/iacore/frp.git && cd frp && go build ./cmd/frps && cp frps ..
COPY frps .
RUN chmod +x frps
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
