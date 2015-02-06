class Runnable
  
  def initialize(data, activity)
    activity.update_display(data)
  end
  
  def run
    puts "run method in runnable class"
  end
  
end
