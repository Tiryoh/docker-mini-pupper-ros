#!/usr/bin/env bash
set -e

if [ -e ${HOME}/catkin_ws/devel/setup.bash ]; then
    source ${HOME}/catkin_ws/devel/setup.bash
fi

MAP_SAVE_DIR=$(rospack find mini_pupper_navigation)"/maps"

echo "save map to ${MAP_SAVE_DIR}"

rosservice call /finish_trajectory 0
rosservice call /write_state "filename: '${MAP_SAVE_DIR}/map.pbstream'"
rosrun cartographer_ros cartographer_pbstream_to_ros_map \
	-map_filestem=${MAP_SAVE_DIR}/map \
	-pbstream_filename=${MAP_SAVE_DIR}/map.pbstream \
	-resolution=0.05

