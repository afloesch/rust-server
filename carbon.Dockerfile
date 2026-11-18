FROM docker.io/library/debian:trixie-slim AS mod-stage

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    wget \
    ca-certificates

WORKDIR /tmp/carbon

RUN wget https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Linux.Release.tar.gz -O carbon.tar.gz

RUN tar -xzvf carbon.tar.gz

RUN rm carbon.tar.gz

FROM rust-server AS production-image

ENV TERM=xterm

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    libgdiplus \
    libc6-dev

COPY --from=mod-stage /tmp/carbon /srv/rust

RUN chmod +x /srv/rust/carbon.sh

ENTRYPOINT ["/srv/rust/carbon.sh"]
