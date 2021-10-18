#!/usr/bin/env bash

set -eoux pipefail

cd helm-charts

trash "*.tgz"

trash elasticsearch
trash kibana

helm pull elastic/elasticsearch
helm pull elastic/kibana

find . -type f -name "*.tgz" -exec tar xvf {} \;
trash "*.tgz"
