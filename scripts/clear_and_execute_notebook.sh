#!/bin/bash
set -e

for notebook in "$@"; do
    jupyter nbconvert --clear-output --inplace "$notebook"
    jupyter nbconvert --to notebook --execute --inplace "$notebook"
done