FROM docker.io/library/debian:trixie-slim AS mod-stage

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    wget \
    ca-certificates

WORKDIR /tmp/carbon

RUN wget https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Linux.Release.tar.gz -O carbon.tar.gz && tar -xzvf carbon.tar.gz

RUN rm carbon.tar.gz

FROM rust-server AS production-image

ENV TERM=xterm

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    libgdiplus \
    libc6-dev

COPY --from=mod-stage /tmp/carbon /srv/rust

COPY run-carbon.sh /srv/rust/run-carbon.sh

RUN chmod +x /srv/rust/run-carbon.sh

ENTRYPOINT ["/srv/rust/run-carbon.sh"]
