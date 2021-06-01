#!/bin/bash

# remove yourself
rm $0

# install scalafix
cs install scalafix

echo
echo '"scalafix" is now on the path (assuming coursier bin directory is also on the path)'
