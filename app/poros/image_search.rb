class ImageSearch
  attr_reader :image_url,
              :photographer,
              :photographer_url,
              :id,
              :location

  def initialize(results, location)
    @id = nil
    @image_url = results[:url]
    @photographer = results[:photographer]
    @photographer_url = results[:photographer_url]
    @location = location
  end

end
