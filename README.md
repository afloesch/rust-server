# Rust Server in Docker

Dockerfiles and a docker compose file to run a vanilla Rust server, or a Rust server with the [Carbon](https://carbonmod.gg/) modding framework.

I make no promises to keep this repo maintained when Facepunch or Carbon break things, but you are free to fork this repo and modify to your needs, or submit a pull request to fix things if/when they release a breaking change.

## Setup

1) Install [docker desktop](https://www.docker.com/products/docker-desktop/).

2) Clone or download this repository to your local file system.

3) Follow the steps below to build the docker images and run the server.

## Build

Docker commands to build the Rust server binary into a docker image, or the Rust server with [Carbon](https://carbonmod.gg/) included.

### Rust Server

```sh
docker build -f server.Dockerfile -t rust-server .
```

This will fetch the latest Rust server binary published on Steam and install it to a linux based container image.

### Carbon

> Note: The Carbon image depends on the vanilla Rust server build, so build the Rust server image first.

```sh
docker build -f carbon.Dockerfile -t rust-server-carbon .
```

This will fetch and install the latest Carbon production release published to GitHub into the Rust server container image.

## Run

Use the docker compose file to start the server and setup the server config files. The docker compose file is setup to use the Carbon image. If you want to run the vanilla server instead change the image in the docker compose file.

Update the ownerid information in the [`config/users.cfg`](config/users.cfg) file. Add your Steam ID and username where specified in the file. Your Steam ID can be found under the "Account Details" tab in Steam.

You can also change or add Rust server ConVars in the [`config/server.cfg`](config/server.cfg) file.

### Start Server

```sh
docker-compose up -d
```

By default the server identity used is `main`, but this can be changed by setting an environment variable. Example:

```sh
SERVER_IDENTITY="devserver" docker-compose up -d
```

Depending on the map size and seed used it may take some time for the server to generate the map on first startup.

### Stop Server

> Note: When stopping the server you may lose progress if a recent save state was not created. To force the server to save open the console in game with F1 and submit the command `server.save` before quitting and shutting down the server.

To stop the server and preserve the game state:
```sh
docker-compose down
```

To stop the server and delete everything:
```sh
docker-compose down --volumes
```

## Connect

To connect to the Rust server when running locally, start the game and open the console by pressing F1. In the console type the following and hit enter:

```
client.connect localhost:28015
```

## Using Carbon

When the ownerid is properly set in the `users.cfg` file you can access the Carbon admin interface in game by opening chat and typing `/cp` or `/cpanel`. Carbon provides a number of useful quality of life features out of the box which would require multiple mods to duplicate when using Oxide, such as:

- Permissions management.
- Various admin tools like invisiblity, teleport, user kick, and user ban.
- Gather settings.
- Item stack size settings.
- And many more...

See the [Carbon](https://carbonmod.gg/) documentation for more info.