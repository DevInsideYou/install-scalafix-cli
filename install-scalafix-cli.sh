#!/bin/bash

FALLBACK_VERSION="0.9.7"

if [ "$1" != "" ] && [ "$2" != "" ]; then
    SCALA_VERSION="$1"
    VERSION="$2"
elif [ "$1" != "" ]; then
    SCALA_VERSION="$1"
    VERSION=$FALLBACK_VERSION
else
    SCALA_VERSION="2.12.10"
    VERSION=$FALLBACK_VERSION
fi

# install scalafix
sudo coursier bootstrap ch.epfl.scala:scalafix-cli_$SCALA_VERSION:$VERSION \
  -r sonatype:snapshots \
  -o /usr/local/bin/scalafix \
  -f --main scalafix.cli.Cli

echo

scalafix --version

echo

echo '"scalafix" is now on the path'

# remove yourself
rm $0
