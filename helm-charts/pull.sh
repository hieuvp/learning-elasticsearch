#!/usr/bin/env bash

set -eoux pipefail

cd helm-charts

trash "*.tgz"
trash elasticsearch
trash kibana

helm pull elastic/elasticsearch --version="7.14.0"
helm pull elastic/kibana --version="7.14.0"

find . -type f -name "*.tgz" -exec tar xvf {} \;
trash "*.tgz"
