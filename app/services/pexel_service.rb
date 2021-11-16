class PexelService

  def self.image_search(query)
    token = ENV["PEXEL_API_KEY"]

    connection = Faraday.new(url: "https://api.pexels.com/v1/search?query=#{query}&per_page=1")

    response = connection.get "https://api.pexels.com/v1/search?query=#{query}&per_page=1" do |request|
      request.headers["Authorization"] = token
    end

    JSON.parse(response.body, symbolize_names: true)
  end

end
