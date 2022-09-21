FROM tiryoh/ros:noetic

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3-wstool python3-rosdep ninja-build stow && \
    apt-get clean -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

WORKDIR /ros_ws

# http://stackoverflow.com/questions/36996046/how-to-prevent-dockerfile-caching-git-clone
ADD https://api.github.com/repos/cartographer-project/cartographer/git/refs/heads/master \
    cartographer_ros/cartographer_version.json

RUN mkdir src && \
    wget https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall && \
    vcs import src < cartographer_ros.rosinstall && \
    sed -i -e "s%<depend>libabsl-dev</depend>%<\!--<depend>libabsl-dev</depend>-->%g" src/cartographer/package.xml && \
    . /opt/ros/noetic/setup.sh && \
    rosdep update && \
    apt-get update && \
    rosdep install --from-paths src --ignore-src -y -r && \
    src/cartographer/scripts/install_abseil.sh && \
    if dpkg -l | grep ros-noetic-abseil-cpp; then\
    apt-get remove ros-noetic-abseil-cpp; \
    fi && \
    apt-get clean -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

RUN . /opt/ros/noetic/setup.sh && \
    catkin_make_isolated --install --use-ninja

RUN apt-get update && \
    apt-get install -y ros-noetic-ecl-threads \
    ros-noetic-gmapping \
    ros-noetic-hector-mapping \
    ros-noetic-octomap \
    ros-noetic-octomap-server \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-global-planner \
    ros-noetic-navfn \
    ros-noetic-dwa-local-planner \
    ros-noetic-base-local-planner \
    ros-noetic-amcl \
    ros-noetic-pointcloud-to-laserscan \
    ros-noetic-ros-controllers \
    ros-noetic-robot-localization \
    ros-noetic-hector-sensors-description \
    libpcl-apps1.10 \
    libpcl-common1.10 \
    libpcl-features1.10 \
    libpcl-filters1.10 \
    libpcl-io1.10 \
    libpcl-kdtree1.10 \
    libpcl-keypoints1.10 \
    libpcl-ml1.10 \
    libpcl-octree1.10 \
    libpcl-outofcore1.10 \
    libpcl-people1.10 \
    libpcl-recognition1.10 \
    libpcl-registration1.10 \
    libpcl-sample-consensus1.10 \
    libpcl-search1.10 \
    libpcl-segmentation1.10 \
    libpcl-stereo1.10 \
    libpcl-surface1.10 \
    libpcl-tracking1.10 \
    libpcl-visualization1.10 \
    libpcl-dev && \
    apt-get clean -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y libudev-dev && \
    apt-get clean -y && \
    rm -rf rm -rf /var/lib/apt/lists/*

