FROM alpine:latest
ENV VERSION 0.58.1
WORKDIR /app/
#RUN apk add go git && git clone https://github.com/iacore/frp.git && cd frp && go build ./cmd/frps && cp frps ..
COPY frps .
RUN chmod +x frps
COPY frps.toml .
CMD ["/app/frps","-c","/app/frps.toml"]

EXPOSE 80/tcp
#EXPOSE 443/tcp

# listener
EXPOSE 7000/udp

# p2p
EXPOSE 7001/udp

# expose more tcp ports below
EXPOSE 1234/tcp
