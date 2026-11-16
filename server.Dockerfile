FROM docker.io/steamcmd/steamcmd:debian-trixie AS install-stage

RUN steamcmd +force_install_dir /srv/rust +login anonymous +app_update 258550 validate +quit

FROM docker.io/library/debian:trixie-slim AS production-image

ENV LD_LIBRARY_PATH=/srv/rust:/srv/rust/RustDedicated_Data/Plugins:/srv/rust/RustDedicated_Data/Plugins/x86_64

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
    ca-certificates \
    netcat-traditional \
    gettext-base \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/rust

COPY --from=install-stage /srv/rust /srv/rust

RUN mkdir /srv/rust/server

# server.port, rcon.port udp, rcon.port tcp, queryport, app.port
EXPOSE 28015/udp 28016/udp 28016/tcp 28017/udp 28082/tcp

ENTRYPOINT ["./RustDedicated"]
