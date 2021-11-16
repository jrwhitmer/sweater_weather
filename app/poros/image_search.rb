class ImageSearch
  attr_reader :image_url,
              :photographer,
              :photographer_url

  def initialize(results)
    @image_url = results[:url]
    @photographer = results[:photographer]
    @photographer_url = results[:photographer_url]
  end

end
