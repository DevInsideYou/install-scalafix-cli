#!/bin/bash

if [ "$1" == "" ]; then
    SCALA_VERSION="2.12.8"
    VERSION="0.9.5"
else
    SCALA_VERSION="$1"
    VERSION="$2"
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
