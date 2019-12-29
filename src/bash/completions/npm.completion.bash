#!/usr/bin/env bash

if command -v npm &>/dev/null; then
    eval "$(npm completion)"
fi
