#!/usr/bin/env bash

ENV_DIR=env
TARBALL_DIR=tarballs/

extract_if_not_exists() {
    # extract $2 if $1 not exists
    [ -d "$1" ] || tar -xzf "$TARBALL_DIR$2"
}

cd "$ENV_DIR"
extract_if_not_exists apache-maven-3.2.5 apache-maven-3.2.5-bin.tar.gz
extract_if_not_exists flink-1.14.5 flink-1.14.5-bin-scala_2.12.tgz
extract_if_not_exists jdk-11.0.15 jdk-11.0.15_linux-x64_bin.tar.gz
