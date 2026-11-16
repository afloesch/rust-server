# Rust Server in Docker

## Build

Docker commands to build a Rust server in a docker image, or the Rust server with Carbon included.

### Rust Server

```sh
docker build -f server.Dockerfile -t rust-server .
```

### Carbon

```sh
docker build -f carbon.Dockerfile -t rust-server-carbon .
```

## Run

Use the docker compose file to start the server and setup the server config files. The docker compose file is setup to use the Carbon image.

Update the ownerid information in the `config/users.cfg` file. Add your Steam ID and username where specified in the file. Your Steam ID can be found under the `Account Details` tab in Steam.

You can also change or add Rust server ConVars in the `config/server.cfg` file.

```sh
docker-compose up -d
```

Depending on the map size and seed used it may take some time for the server to generate the map on the first startup.