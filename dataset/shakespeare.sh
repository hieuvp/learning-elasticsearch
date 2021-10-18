#!/usr/bin/env bash

set -eou pipefail

readonly DATASET_PATH="dataset/shakespeare"

set -x

trash "$DATASET_PATH"
mkdir --parents "$DATASET_PATH"
cd "$DATASET_PATH"

curl --remote-name http://media.sundog-soft.com/es7/shakes-mapping.json
curl --remote-name http://media.sundog-soft.com/es7/shakespeare_7.0.json
