# Mods

Helpers to manage mod installation into the server volumes. The init-mods container in the docker compose file will install these plugins when starting the server.

## Setup

Place downloaded plugin files into the `plugins` folder, or update the [`mod-list.txt`](./mod-list.txt) file with a list of plugin URLs to be downloaded. 

Multiple plugin URLs should be separated by a new line, and must be public URLs which do not require authentication.

For example:

```txt
https://umod.org/plugins/VehicleLicence.cs
https://umod.org/plugins/MonumentFinder.cs
https://umod.org/plugins/CustomVendingSetup.cs
```

If you have paid plugins to install, which require authentication to be downloaded, manually download and place those plugins into the `plugins` folder to add them to the server.

## Updating Plugins

The init-mods container will update the server plugins anytime the server is started with docker compose.

To update the server plugins while the server is running restart the docker compose init-mods container:
```sh
docker-compose restart init-mods
```