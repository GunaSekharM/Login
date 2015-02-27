class RegisterActivity < Android::App::Activity
  DATA = "com.yourcompany.helloworld.json_data"
  def onCreate(savedInstanceState)
    super
    self.requestWindowFeature(Android::View::Window::FEATURE_NO_TITLE)
    #getWindow.getDecorView.setSystemUiVisibility(Android::View::View::SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
    layout = resources.getIdentifier('register_page', 'layout', packageName)
    self.contentView = layout
    
    title_image = resources.getIdentifier('title_image_id', 'id', packageName)
    findViewById(title_image)
    
    symbol_image = resources.getIdentifier('symbol_image_id', 'id', packageName)
    findViewById(symbol_image)
    
    @logout_button = resources.getIdentifier('logout_button_id', 'id', packageName)
    logout_button_value = findViewById(@logout_button)
    logout_button_value.onClickListener = self
    
    view_sub = resources.getIdentifier('sub_view', 'id', packageName)
    findViewById(view_sub)
    
    heading_label = resources.getIdentifier('heading_label_id', 'id', packageName)
    findViewById(heading_label)
    
    label_id = resources.getIdentifier('id_label', 'id', packageName)
    id_label_view = findViewById(label_id)
    
    text_id = resources.getIdentifier('text_field', 'id', packageName)
    id_text_value = findViewById(text_id)
    
    first_name_label_id = resources.getIdentifier('first_name_label', 'id', packageName)
    first_name_label_view = findViewById(first_name_label_id)
    
    first_name_text_id = resources.getIdentifier('first_name_text_field', 'id', packageName)
    first_name_text_value = findViewById(first_name_text_id)
    
    phone_number_label_id = resources.getIdentifier('phone_number_label', 'id', packageName)
    phone_number_label_view = findViewById(phone_number_label_id)
    
    phone_number_text_id = resources.getIdentifier('phone_number_text_field', 'id', packageName)
    phone_number_text_value = findViewById(phone_number_text_id)
    
    city_text_id = resources.getIdentifier('city_text', 'id', packageName)
    findViewById(city_text_id)
    
    spinner_city = resources.getIdentifier('city_spinner', 'id', packageName)
    spinner = findViewById(spinner_city)
    list = ["Hyderabad", "Kurnool", "Bangalore", "Chennai", "Mumbai"]
    adapter = Android::Widget::ArrayAdapter.new(self, Android::R::Layout::Simple_list_item_single_choice, list)
    adapter.setDropDownViewResource(Android::R::Layout::Simple_list_item_single_choice)
    spinner.setAdapter(adapter)
    spinner.setOnItemSelectedListener(OnItemSelectedListener.new(self))
    
    controller_bar = resources.getIdentifier('controller_bar_id', 'id', packageName)
    findViewById(controller_bar)
    
    previous_button = resources.getIdentifier('previous_button_id', 'id', packageName)
    findViewById(previous_button)
    
    save_button = resources.getIdentifier('save_button_id', 'id', packageName)
    findViewById(save_button)
    
    @dash_button = resources.getIdentifier('dash_button_id', 'id', packageName)
    dash_button_value = findViewById(@dash_button)
    dash_button_value.onClickListener = self
    
    reset_button = resources.getIdentifier('reset_button_id', 'id', packageName)
    findViewById(reset_button)
    
    next_button = resources.getIdentifier('next_button_id', 'id', packageName)
    findViewById(next_button)
    
    values = self.intent.getStringExtra(DATA)
    json_obj = Org::Json::JSONObject.new(values)
    id_text_value.text = json_obj.getString("id")
    first_name_text_value.text = json_obj.getString("firstName")
    phone_number_text_value.text = json_obj.getString("primaryMobileNumber")
    #getting_data
    #doPostRequest
  end
  
  def onClick(view)
    if view.getId == @dash_button
      i = Android::Content::Intent.new(self, DashboardActivity)
      startActivity(i)
    elsif view.getId == @logout_button
      view.setPressed(true)
      i = Android::Content::Intent.new(self, MainActivity)
      startActivity(i)
    end
  end
  
  def doPostRequest
    #task = Java::Lang::Thread.new(ApiExecution.new(self))
    #task.start
    #(Array.new(1, "http://sumerudevserver.cloudapp.net/tatacapitaldev/Token"))
  end
    
  def getting_data
    url = 'http://sumerudevserver.cloudapp.net/tatacapitaldev/Token'
    success = RequestListener.new(self)
    error = ResponseErrorListener.new(self)
    get_request = Com::Android::Volley::Toolbox::JsonObjectRequest.new(VolleyMethods::POST, url, success, error)
    data = Com::Android::Volley::Toolbox::Volley.newRequestQueue(self).add(get_request)
    puts data
  end
  def display_city(value)
    #@city_text_obj.text = value
  end
  
end
