class ActivitiesFacade

  def self.get_one_activity(type)
    data = ActivitiesService.get_one_activity(type)

    Activity.new(data)
  end
end
