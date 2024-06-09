#!/usr/bin/env bash

set -e

source "$(dirname "$0")/../bin/common.sh"

export NODE_VERSION=22.2.0  # Set your desired Node.js version here

install_or_update "node" "$NODE_VERSION" "node -v | sed 's/v//'"
