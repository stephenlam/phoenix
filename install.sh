#!/usr/bin/env bash


# Get current dir
export PHOENIX_DIR
PHOENIX_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Create symlinks
ln -sfv "$PHOENIX_DIR/configuration.nix" /etc/nixos/configuration.nix

# Rebuild and switch
nixos-rebuild switch


