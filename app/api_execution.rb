class ApiExecution
  attr_accessor :activity, :profile_data
  def initialize(activity)
    @activity = activity
  end
  def run
    url = "http://sumerudevserver.cloudapp.net/tatacapitaldev/Token"
    
    client = Org::Apache::Http::Impl::Client::DefaultHttpClient.new
    post = Org::Apache::Http::Client::Methods::HttpPost.new(url)
    nameValuePairs = Array.new(3)
    nameValuePairs.add(Org::Apache::Http::Message::BasicNameValuePair.new("username", "tatacap@yopmail.com"))
    nameValuePairs.add(Org::Apache::Http::Message::BasicNameValuePair.new("password", "capfirst123"))
    nameValuePairs.add(Org::Apache::Http::Message::BasicNameValuePair.new("grant_type", "password"))
    post.setEntity(Org::Apache::Http::Client::Entity::UrlEncodedFormEntity.new(nameValuePairs))
    post.setHeader('Content-Type', 'application/x-www-form-urlencoded;charset=utf-8')
    
    response = client.execute(post)
    res_entity = Org::Apache::Http::Util::EntityUtils.toString(response.getEntity)
    if res_entity != nil
      result = res_entity.to_s
      json_obj = Org::Json::JSONObject.new(result)
      json_data = json_obj.getString("access_token")
      get_url = "http://sumerudevserver.cloudapp.net/TataCapitalDev/api/mvp/account/profile/channel/21280"
      get = Org::Apache::Http::Client::Methods::HttpGet.new(get_url)

      get.setHeader("Authorization", "Bearer #{json_data}")
      get.setHeader("Content-Type", "application/json")
      response = client.execute(get)
      get_result = Org::Apache::Http::Util::EntityUtils.toString(response.getEntity)
      if get_result != nil
        profile_data = get_result.to_s
      else
        profile_data = "json data is not getting"
      end
    else
      result = "Did not work!"
    end
    #puts profile_data
    @activity.update_display(profile_data)
    #@activity.runOnUiThread(activity.update_display(profile_data))
  end
end