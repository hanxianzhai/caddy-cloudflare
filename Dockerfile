FROM caddy:2.7.2-builder AS builder
ENV CADDY_VERSION=v2.7.2
RUN xcaddy build master \
  --with github.com/caddy-dns/cloudflare \
  --with github.com/aksdb/caddy-cgi/v2

FROM caddy:2.7.2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
