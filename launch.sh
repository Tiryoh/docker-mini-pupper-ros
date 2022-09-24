#!/usr/bin/env bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

cd $SRC_DIR
rocker --nvidia --x11 --user --network=host --volume \
	$(pwd)/mnpp_ws:/home/$(whoami)/catkin_ws \
	$(pwd)/.bashrc:/home/$(whoami)/.bashrc \
	$(pwd)/.inputrc:/home/$(whoami)/.inputrc \
	$(pwd)/save_map.sh:/home/$(whoami)/save_map.sh \
	-- tiryoh/mini-pupper-ros:latest
