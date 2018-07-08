#!/usr/bin/env bash

set -u

file="$1"
hugo new ${file}
idea content/${file}