# docker-mini-pupper-ros
Dockerfile for Mini Pupper ROS package

## Installation

### Install osrf/rocker

Follow the official document: https://github.com/osrf/rocker

### Download this repository with the Mini Pupper ROS packages

```
git clone --recursive https://github.com/Tiryoh/docker-mini-pupper-ros.git
```

### Build the docker image

```
cd docker-mini-pupper-ros
./build.sh
```

## Usage

Run the following command to launch the docker container.

```
./launch.sh
```


## License

```
Copyright (c) 2022 Daisuke Sato <tiryoh@gmail.com>
```

This repository is licensed under the MIT License, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is licensed under the MIT license.
