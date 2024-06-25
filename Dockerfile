# fetch a version of railway cli
FROM alpine:3.20 as fetcher
WORKDIR /cli
RUN apk add --no-cache wget musl-dev openssl-dev
RUN wget https://github.com/railwayapp/cli/releases/download/v3.10.0/railway-v3.10.0-x86_64-unknown-linux-musl.tar.gz -O pkg.tar.gz
RUN tar -xvzf pkg.tar.gz

# just copy the binary into a clean container
FROM alpine:3.20
COPY --from=fetcher /cli/railway /usr/bin/railway

# we're done bruh
