#!/usr/bin/env bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

cd $SRC_DIR
docker build -t ghcr.io/tiryoh/mini-pupper-ros:noetic .
