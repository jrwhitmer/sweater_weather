class Activity
  attr_reader :name,
              :type,
              :participants,
              :price

  def initialize(results)
    @name = results[:activity]
    @type = results[:type]
    @participants = results[:participants]
    @price = results[:price]
  end

end
