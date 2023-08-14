FROM caddy:2.7.2-builder AS builder
RUN xcaddy build v2.7.2 \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/aksdb/caddy-cgi/v2

FROM caddy:2.7.2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
