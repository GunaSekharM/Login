class RequestListener
  attr_accessor :activity
  
  def initialize(activity)
    @activity = activity
    puts "success block&&&&&&&&&&&&&&&&&&&"
  end
  
  def onResponse(json)
    puts "onResponse method****************"
    puts json
  end
end