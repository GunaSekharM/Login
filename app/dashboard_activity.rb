class DashboardActivity < Android::App::Activity
  USERNAME = "com.yourcompany.helloworld.user_name"
  PASSWORD = "com.yourcompany.helloworld.password"
  def onCreate(savedInstanceState)
    super
    self.requestWindowFeature(Android::View::Window::FEATURE_NO_TITLE)
    #getWindow.getDecorView.setSystemUiVisibility(Android::View::View::SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
    layout = resources.getIdentifier('dashboard', 'layout', packageName)
    self.contentView = layout
    
    title_image = resources.getIdentifier('title_image_id', 'id', packageName)
    findViewById(title_image)
    
    symbol_image = resources.getIdentifier('symbol_image_id', 'id', packageName)
    findViewById(symbol_image)
    
    @logout_button = resources.getIdentifier('logout_button_id', 'id', packageName)
    @logout_button_value = findViewById(@logout_button)
    @logout_button_value.onClickListener = self
    
    view_sub = resources.getIdentifier('sub_view', 'id', packageName)
    view_sub_value = findViewById(view_sub)
    
    add_leads = resources.getIdentifier('add_leads_id', 'id', packageName)
    add_leads_value = findViewById(add_leads)
    add_leads_value.onClickListener = self

    @basic_details = resources.getIdentifier('basic_details_id', 'id', packageName)
    @basic_details_value = findViewById(@basic_details)
    @basic_details_value.onClickListener = self

    issue_receipt = resources.getIdentifier('issue_receipt_id', 'id', packageName)
    issue_receipt_value = findViewById(issue_receipt)
    issue_receipt_value.onClickListener = self
    
    change_password = resources.getIdentifier('change_password_id', 'id', packageName)
    change_password_value = findViewById(change_password)
    change_password_value.onClickListener = self
    
    search_account = resources.getIdentifier('search_account_id', 'id', packageName)
    search_account_value = findViewById(search_account)
    search_account_value.onClickListener = self
    
    top_accounts = resources.getIdentifier('top_accounts_id', 'id', packageName)
    top_accounts_value = findViewById(top_accounts)
    top_accounts_value.onClickListener = self
    
    progress_text = resources.getIdentifier('progress_text_id', 'id', packageName)
    @progress_text_value = findViewById(progress_text)
    
    # puts "dashboard activity***************"
    #     grid_view = resources.getIdentifier('grid_view_id', 'id', packageName)
    #     grid_view_obj = findViewById(grid_view)
    #     grid_view_obj.setAdapter(ImageAdapter.new(self))
    #     grid_view_obj.setOnItemClickListener(OnItemClickListener.new)
  end
  
  def onClick(view)
    @basic_details_value.setEnabled(false)
    @logout_button_value.setEnabled(false)
    if view.getId == @basic_details
      progress_bar_id = resources.getIdentifier('progress_bar', 'id', packageName)
      pDialog = findViewById(progress_bar_id)
      @progress_text_value.setVisibility(0)
      task = HttpAsyncTask.new(self, 'http://sumerudevserver.cloudapp.net/tatacapitaldev/Token', pDialog)
      url = ["http://sumerudevserver.cloudapp.net/tatacapitaldev/Token"]
      task.execute(url)
     elsif view.getId == @logout_button
       #view.setPressed(true)
       i = Android::Content::Intent.new(self, MainActivity)
       startActivity(i)
    end
  end
  def update_display(json_data)
    @progress_text_value.setVisibility(4)
    i = Android::Content::Intent.new(self, RegisterActivity)
    i.putExtra(RegisterActivity::DATA, json_data)
    startActivity(i)
  end
end