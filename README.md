# rFactor2 Docker Server

A Docker container solution for running rFactor2 dedicated servers, combining the power of containerized Windows environments with automated rFactor2 server setup.

## Overview

This project creates a containerized rFactor2 dedicated server by combining:
- **Windows virtualization** via [dockur/windows](https://github.com/dockur/windows)
- **rFactor2 server automation** from [afloesch/rfactor2-server-setup](https://github.com/afloesch/rfactor2-server-setup)

## Features

- Fully containerized rFactor2 dedicated server
- Automated server configuration and setup
- Easy deployment and management
- Isolated server environment

## Prerequisites

- Docker installed on your host system
- Sufficient system resources for Windows virtualization

## Quick Start

```bash
# Clone this repository
git clone https://github.com/b3nz0/rfactor2-docker-server.git
cd rfactor2-docker-server

# Build and run the container
docker-compose up -d
```

You can monitor the progress of the build by browsing to http://<docker-host-ip>:8006

## Configuration

Once the container has initialised and Windows has completed installing, you are presented with a Desktop environment.

The deployment is supposed to launch `install.bat` automatically from the `C:\OEM` folder - if this doesn't occur, manually execute the BAT file to deploy `steamcmd` and `rfactor2-dedicated-server` or simply run the `ps1` file - either should work fine.

Modify `rf2serversetup.ps1` with the content you require.

```
...
./steamcmd +login anonymous +workshop_download_item 365960 1629100532 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629067802 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629142012 +quit
./steamcmd +login anonymous +workshop_download_item 365960 1629177826 +quit
...
```

In the above example, `365960` == rFactor2 and `1629100532` etc are Workshop IDs from the RF2 Steam Workshop

Once the bootstrapping is complete (steamcmd + rfactor-dedicated-server + steam workshop content) you need to use `ModMgr.exe` to install all the content which should have been automatically moved from `C:\steamcmd\steamsapps\workshop\content\365960` to `C:\rfactor2-dedicated\Packages`

Once all the content has been installed, use `MAS.exe` to build a mod package for use with the dedicated server. This should be fairly straight forward, I'm not going to go into detail on this as yet. I may update this README in future.

## Credits

This project builds upon the excellent work from:

- **[afloesch/rfactor2-server-setup](https://github.com/afloesch/rfactor2-server-setup)** - Provides the rFactor2 server setup automation and configuration scripts
- **[dockur/windows](https://github.com/dockur/windows)** - Enables running Windows applications in Docker containers

- **[RF2 Official User Guides](https://docs.studio-397.com/display/UG/Setting+up+a+Dedicated+Server)** - Official User Guide for RF2 Dedi-Server

## License

[Add your license information here]

## Contributing

[Add contribution guidelines here]

## Support

[Add support information here]