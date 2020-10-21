# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


locals {
  "env" = "prod"
}

provider "google" {
  project = "${var.project}"
}

resource "google_composer_environment" "example-resource" {
  name   = "example-environment"
  region = "australia-southeast1"

  config {
    node_config {
      zone = "australia-southeast1-b"
      machine_type = "n1-standard-2"
    }
    software_config {
      image_version = "composer-latest-airflow-1.10.6"
    }
  }
}

resource "google_storage_bucket" "csv_load" {
name = "csv_load"
location = "australia-southeast1"
storage_class = "REGIONAL"
}