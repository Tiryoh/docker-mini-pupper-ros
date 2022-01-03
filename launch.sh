#!/usr/bin/env bash
set -eu

rocker --nvidia --x11 --user --network=host --volume \
	$(pwd)/mnpp_ws:/home/$(whoami)/catkin_ws \
	$(pwd)/.bashrc:/home/$(whoami)/.bashrc \
	$(pwd)/.inputrc:/home/$(whoami)/.inputrc \
	$(pwd)/save_map.sh:/home/$(whoami)/save_map.sh \
	-- tiryoh/mini-pupper-ros:latest
