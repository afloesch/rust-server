# Mods

Some helpers to manage mod installation into the server volumes. The init-mods container in the docker compose file will install these plugins when starting the server.

Place downloaded plugin files into the `plugins` folder, or update the [`mod-list.txt`](./mod-list.txt) file with a list of URLs for plugins to be downloaded. 

Multiple plugin URLs should be separated by a new line, and must be public URLs which do not require authentication.

For example:

```txt
https://umod.org/plugins/VehicleLicence.cs
https://umod.org/plugins/MonumentFinder.cs
https://umod.org/plugins/CustomVendingSetup.cs
```