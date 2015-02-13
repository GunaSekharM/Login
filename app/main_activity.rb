class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    
    layout = resources.getIdentifier('hello', 'layout', packageName)
    self.contentView = layout
    
    view_sub = resources.getIdentifier('sub_view', 'id', packageName)
    findViewById(view_sub)
    
    label_id = resources.getIdentifier('heading_label', 'id', packageName)
    header_label = findViewById(label_id)
    
    view_id = resources.getIdentifier('text', 'id', packageName)
    textView = findViewById(view_id)
    
    text_id = resources.getIdentifier('text_field', 'id', packageName)
    @text_box_value = findViewById(text_id)
    
    label_view = resources.getIdentifier('label', 'id', packageName)
    text_view = findViewById(label_view)
    
    text_field_id = resources.getIdentifier('text_field_id', 'id', packageName)
    @text_box = findViewById(text_field_id)
    
    @button_id = resources.getIdentifier('login_button', 'id', packageName)
    button_view = findViewById(@button_id)
    button_view.onClickListener = self
    
    # @register_id = resources.getIdentifier('register', 'id', packageName)
    #     register_button = findViewById(@register_id)
    #     register_button.onClickListener = self
  end
  
  def onClick(view)
    if view.getId == @button_id
      if @text_box.getText.toString == "capfirst123" && @text_box_value.getText.toString == "tatacap@yopmail.com"
        #progress_bar_id = resources.getIdentifier('progress_bar', 'id', packageName)
        #pDialog = findViewById(progress_bar_id)
        # pDialog = Android::Widget::ProgressDialog.new(self)
        #        pDialog.setTitle("Please Wait!!")
        #        pDialog.setMessage("Wait!!")
        #        pDialog.setCancelable(false)
        #        #pDialog.setProgressStyle(Android::Widget::ProgressDialog::STYLE_SPINNER)
        #        pDialog.show()
        
        i = Android::Content::Intent.new(self, DashboardActivity)
        startActivity(i)
      end
    elsif view.getId == @register_id
      pwd_value = @text_box.getText.toString
      username_value = @text_box_value.getText.toString
      if pwd_value == "123@asAS"
        #intent will describes what operation to be performed
      end
    end
  end
  def update_display(json_data)
    i = Android::Content::Intent.new(self, DashboardActivity)
    i.putExtra(DashboardActivity::DATA, json_data)
    startActivity(i)
  end
end

# data_base = MyDatabaseHelper.new(self)
#       data_base.add_credentials(@text_box_value.getText.toString, @text_box.getText.toString)
#       puts data_base.get_credentials
#       puts @text_box_value.getText.toString
#task = APILoad.new
#task.execute("http://sumerudevserver.cloudapp.net/tatacapitaldev/Token")
