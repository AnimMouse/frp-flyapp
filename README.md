# frp on fly.io
[Fast reverse proxy](https://github.com/fatedier/frp) on [fly.io](https://fly.io)

Run your own frp tunnel for free (within free tier) on fly.io

Now you can have ngrok TCP/UDP tunnel with the ports you want, not randomly generated ones on ngrok unless you [pay for the pro monthly](https://ngrok.com/pricing).

## fly.io Deployment
You need [flyctl](https://github.com/superfly/flyctl)

1. Clone this repo
2. Create an app on fly.io `fly launch --copy-config --name app-name`
3. To deploy, type y if prompted to deploy now.
4. Set environment variables `fly secrets set -a app-name FRP_TOKEN=12345678 FRP_DASH_USER=admin FRP_DASH_PWD=admin`
5. Try to connect to frps using `server_addr = app-name.fly.dev` and `server_port = 7000` in frpc.ini

You can also view https://app-name.fly.dev in browser to view the frps dashboard.

## Change server config
Type `fly deploy -a app-name` on the repository after editing frps.ini

## Switch
fly.io runs app 24/7, if you are not using your tunnel for a while, it is recommended to suspend it to conserve free tier and resources.

Suspend frp `fly suspend app-name`\
Resume frp `fly resume app-name`

## KCP support
To use [KCP](https://github.com/skywind3000/kcp/blob/master/README.en.md) (a protocol built on UDP) instead of TCP if you don't want TCP meltdown (TCP over TCP tunnel) and to reduce latency (like for game servers):

1. Uncomment frp KCP server and comment frp TCP server in fly.toml
2. Uncomment For KCP connection and comment For TCP connection in frps.ini

Since in fly.io, it is [required to bind to `fly-global-services`](https://fly.io/docs/app-guides/udp-and-tcp/) in order for UDP to work, but frp only allow to bind in one address, so we need to disable TCP if you want to use KCP as TCP does not work on `fly-global-services`.

### fly.io free tier
fly.io requires a credit card in order to work, if you don't have a credit card or if you are afraid that fly.io will charge you so much, it is recommend to buy prepaid credits.

### More infos
If you are tunneling HTTP apps instead of TCP/UDP, I recommend to just use [Cloudflare Tunnel](https://www.cloudflare.com/products/tunnel/).

[anderspitman/awesome-tunneling](https://github.com/anderspitman/awesome-tunneling)

# 🖕 CGNAT