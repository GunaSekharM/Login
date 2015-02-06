class RegisterActivity < Android::App::Activity
  PWD = "com.yourcompany.helloworld.pwd_value"
  USERNAME = "com.yourcompany.helloworld.username_value"
  def onCreate(savedInstanceState)
    super
    layout = resources.getIdentifier('register_page', 'layout', packageName)
    self.contentView = layout
    
    label_id = resources.getIdentifier('id_label', 'id', packageName)
    @id_label_view = findViewById(label_id)
    
    text_id = resources.getIdentifier('text_field', 'id', packageName)
    @id_text_value = findViewById(text_id)
    
    first_name_label_id = resources.getIdentifier('first_name_label', 'id', packageName)
    @first_name_label_view = findViewById(first_name_label_id)
    
    first_name_text_id = resources.getIdentifier('first_name_text_field', 'id', packageName)
    @first_name_text_value = findViewById(first_name_text_id)
    
    phone_number_label_id = resources.getIdentifier('phone_number_label', 'id', packageName)
    @phone_number_label_view = findViewById(phone_number_label_id)
    
    phone_number_text_id = resources.getIdentifier('phone_number_text_field', 'id', packageName)
    @phone_number_text_value = findViewById(phone_number_text_id)
    
    #getting_data
    doPostRequest
    #GettingDataFromServer.new.execute("http://sumerudevserver.cloudapp.net/tatacapitaldev/Token")
  end
  
  def doPostRequest
    #task = Java::Lang::Thread.new(ApiExecution.new(self))
    #task.start
    #MyLooper.new.start
    task = HttpAsyncTask.new(self)
    task.execute(["http://sumerudevserver.cloudapp.net/tatacapitaldev/Token"])#(Array.new(1, "http://sumerudevserver.cloudapp.net/tatacapitaldev/Token"))
  end
    
  def getting_data
    url = 'http://sumerudevserver.cloudapp.net/tatacapitaldev/Token'
    success = RequestListener.new(self)
    error = ResponseErrorListener.new(self)
    get_request = Com::Android::Volley::Toolbox::JsonObjectRequest.new(VolleyMethods::POST, url, success, error)
    data = Com::Android::Volley::Toolbox::Volley.newRequestQueue(self).add(get_request)
    puts data
  end
  
  def update_display(weather)
    puts weather
    json_obj = Org::Json::JSONObject.new(weather)
    @id_text_value.text = json_obj.getString("id")
    @first_name_text_value.text = json_obj.getString("firstName")
    @phone_number_text_value.text = json_obj.getString("primaryMobileNumber")
    puts json_obj.getString("primaryMobileNumber")
  end
end
