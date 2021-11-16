class UserSerializer
  include JSONAPI::Serializer

  attribute :email, :api_key

  # {
  #   "data": {
  #     "type": "users",
  #     "id": :id,
  #     "attributes": {
  #       "email": :email,
  #       "api_key": :api_key
  #     }
  #   }
  # }
end
