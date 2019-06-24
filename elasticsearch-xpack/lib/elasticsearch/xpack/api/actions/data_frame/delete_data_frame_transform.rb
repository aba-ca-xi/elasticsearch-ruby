# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module XPack
    module API
      module DataFrame
        module Actions

          # Deletes an existing data frame transform.
          #
          # @option arguments [String] :transform_id The id of the transform to delete. *Required*
          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/delete-data-frame-transform.html
          #
          # @since 7.2.0
          def delete_data_frame_transform(arguments={})
            raise ArgumentError, "Required argument 'transform_id' missing" unless arguments[:transform_id]
            transform_id = URI.escape(arguments[:transform_id])

            method = Elasticsearch::API::HTTP_DELETE
            path   = "_data_frame/transforms/#{transform_id}"
            params = {}
            body   = nil

            perform_request(method, path, params, body).body
          end
        end
      end
    end
  end
end