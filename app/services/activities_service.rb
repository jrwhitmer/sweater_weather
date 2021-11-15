class ActivitiesService

  def self.get_one_activity(type)
    response = Faraday.get("http://www.boredapi.com/api/activity?type=#{type}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
