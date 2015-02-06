class JsonObjectRequest
  
  def initialize(method, url, success, error)
    
  end
  
  def getPostParams
    params = Java::Util::HashMap.new
    params.put("username", "tatacap@yopmail.com")
    params.put("password", "capfirst123")
    params.put("grant_type", "password")
    params 
  end
  
  def getHeaders
    header = Java::Util::HashMap.new
    header.put("Content-Type", "application/json")
  end
end