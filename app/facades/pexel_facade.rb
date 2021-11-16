class PexelFacade

  def self.image_search(query)
    data = PexelService.image_search(query)
    
    ImageSearch.new(data[:photos].first)
  end

end
