class ResponseErrorListener
  def initialize(activity)
    puts "error block ******************"
  end
  
  def onErrorResponse(error)
    puts "error@@@@@@@@@@@@@@@@@@@@@@"
    puts error
  end
end