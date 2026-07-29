#!/bin/bash -e
# Copyright (C) 2021 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

KLEAF_REPO_DIR=$($(dirname $(dirname $(readlink -f "$0")))/gettop.sh)

PREBUILT_PYTHON3="$KLEAF_REPO_DIR/prebuilts/build-tools/path/linux-x86/python3"
if [[ -x "$PREBUILT_PYTHON3" ]]; then
    PYTHON3="$PREBUILT_PYTHON3"
else
    PYTHON3=$(which python3)
fi

exec "$PYTHON3" $(dirname $(readlink -f "$0"))/bazel.py "$KLEAF_REPO_DIR" "$@"
