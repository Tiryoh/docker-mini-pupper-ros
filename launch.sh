#!/usr/bin/env bash
set -eu

NVIDIA=""

if which nvidia-smi; then
	NVIDIA="--nvidia"
	echo "NVIDIA driver detected"
fi

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

cd $SRC_DIR

# --privileged is not recommended, but it is required to use --network=host for now
# https://github.com/osrf/rocker/issues/13

rocker $NVIDIA --x11 --user \
	--network=host --privileged \
	-e SHELL=/bin/bash --volume \
	${HOME}/.ssh:/home/$(whoami)/.ssh:ro \
	${SRC_DIR}/mnpp_ws:/home/$(whoami)/catkin_ws \
	${SRC_DIR}/.ros:/home/$(whoami)/.ros \
	${SRC_DIR}/.gazebo:/home/$(whoami)/.gazebo \
	${SRC_DIR}/.bashrc:/home/$(whoami)/.bashrc \
	${SRC_DIR}/.inputrc:/home/$(whoami)/.inputrc \
	${SRC_DIR}/save_map.sh:/home/$(whoami)/save_map.sh \
	-- ghcr.io/tiryoh/mini-pupper-ros:noetic
