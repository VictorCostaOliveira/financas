class ApiController < ApplicationController

  protected

    def serialize_resource(resource, serializer)
      response = {}
      response[resource.model_name.param_key.to_sym] = JSON.parse(serializer.new(resource, {}).to_json)
      { data: response }
    end

    def serialize_resource_list(resources, serializer)
      { data: JSON.parse(ActiveModelSerializers::SerializableResource.new(resources, each_serializer: serializer).to_json) }
    end

    def set_response(status, message)
      message = message.is_a?(Hash) ? message[:data] : message
      {
        status: status,
        data: message
      }
    end

    def test_password(password, hash)
      BCrypt::Password.new(hash) == password
    end

end
