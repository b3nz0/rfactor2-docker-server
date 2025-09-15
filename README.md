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

Once the container has initialised and Windows has completed installing, you are presented with a Desktop environment. The deployment is supposed to launch install.bat from the `C:\OEM` folder - if this doesn't occur, manually execute the BAT file to deploy `steamcmd` and `rfactor2-dedicated-server`.

Modify `rf2serversetup.ps1` with the content you require.

## Credits

This project builds upon the excellent work from:

- **[afloesch/rfactor2-server-setup](https://github.com/afloesch/rfactor2-server-setup)** - Provides the rFactor2 server setup automation and configuration scripts
- **[dockur/windows](https://github.com/dockur/windows)** - Enables running Windows applications in Docker containers

## License

[Add your license information here]

## Contributing

[Add contribution guidelines here]

## Support

[Add support information here]