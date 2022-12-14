#!/usr/bin/env bash

# Copyright 2022 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This script checks whether updating of device plugin API is needed or not. We
# should run `hack/update-generated-dynamic-resource-allocation.sh` if device plugin API is
# out of date.
# Usage: `hack/verify-generated-dynamic-resource-allocation.sh`.

set -o errexit
set -o nounset
set -o pipefail

KUBE_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
ERROR="Dynamic resource allocation kubelet plugin api is out of date. Please run hack/update-generated-dynamic-resource-allocation.sh"
DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1="${KUBE_ROOT}/staging/src/k8s.io/kubelet/pkg/apis/dra/v1alpha1/"

source "${KUBE_ROOT}/hack/lib/protoc.sh"
kube::golang::setup_env

function cleanup {
	rm -rf "${DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1}/_tmp/"
}

trap cleanup EXIT

mkdir -p "${DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1}/_tmp"
cp "${DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1}/api.pb.go" "${DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1}/_tmp/"

KUBE_VERBOSE=3 "${KUBE_ROOT}/hack/update-generated-dynamic-resource-allocation.sh"
kube::protoc::diff "${DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1}/api.pb.go" "${DYNAMIC_RESOURCE_ALLOCATION_V1ALPHA1}/_tmp/api.pb.go" "${ERROR}"
echo "Generated dynamic resource allocation kubelet plugin alpha api is up to date."
