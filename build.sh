#!/bin/bash
# NSnitch DNS Server
#
#    Copyright 2017 Tenta, LLC
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
#
# For any questions, please contact developer@tenta.io
#
# build.sh: *nix/Mac build wrapper

echo "Compiling to GOPATH/bin"

version="development`date -u +.%Y%m%d.%H%M%S`"
if [ -n "$BUILD_ID" ]; then
  version="b${BUILD_ID}"
fi

echo "Compiling version $version"

go install -ldflags "-X main.version=$version" -v github.com/tenta-browser/tenta-dns
go install -ldflags "-X main.version=$version" -v github.com/tenta-browser/tenta-dns/stresser
