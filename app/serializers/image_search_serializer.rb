class ImageSearchSerializer
  include JSONAPI::Serializer
  set_type :image

  attribute :location
  attribute :image_url
  attribute :photographer
  attribute :photographer_url

end
