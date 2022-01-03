#!/usr/bin/env bash
set -e

source $HOME/mnpp_ws/devel/setup.bash
rosservice call /finish_trajectory 0
rosservice call /write_state "filename: '${HOME}/mnpp_ws/src/minipupper_ros/mini_pupper/maps/map.pbstream'"
rosrun cartographer_ros cartographer_pbstream_to_ros_map \
	-map_filestem=${HOME}/mnpp_ws/src/minipupper_ros/mini_pupper/maps/map \
	-pbstream_filename=${HOME}/mnpp_ws/src/minipupper_ros/mini_pupper/maps/map.pbstream \
	-resolution=0.05

