#!/usr/bin/env bash

ENV_DIR=env
TARBALL_DIR=tarballs/
COS_BASE_URL="https://flinkcep-1252312351.cos.ap-beijing.myqcloud.com/tarballs/"

download_and_extract() {
    # download (if not exists) and extract $1
    mkdir -p "$TARBALL_DIR"
    local tarball="$TARBALL_DIR$1"
    [ -f "$tarball" ] || curl -L "$COS_BASE_URL$1" -o "$tarball"
    tar -xzf "$tarball"
}

extract_if_not_exists() {
    # extract $2 if $1 not exists
    [ -d "$1" ] || download_and_extract $2
}

cd "$ENV_DIR"
extract_if_not_exists apache-maven-3.2.5 apache-maven-3.2.5-bin.tar.gz
extract_if_not_exists flink-1.14.5 flink-1.14.5-bin-scala_2.12.tgz
extract_if_not_exists jdk-11.0.15 jdk-11.0.15_linux-x64_bin.tar.gz
