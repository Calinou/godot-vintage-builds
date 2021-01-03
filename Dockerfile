FROM ubuntu:14.04

RUN \
    apt update -qq && \
    apt install -yqq \
            git build-essential scons pkg-config libx11-dev libxcursor-dev libxinerama-dev \
            libgl1-mesa-dev libglu-dev libasound2-dev libpulse-dev libudev-dev \
            libxi-dev libxrandr-dev libcurl4-openssl-dev libfreetype6-dev
