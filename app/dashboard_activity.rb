class DashboardActivity < Android::App::Activity
  
  def onCreate(savedInstanceState)
    super
    
    layout = resources.getIdentifier('dashboard', 'layout', packageName)
    self.contentView = layout
    
    view_sub = resources.getIdentifier('sub_view', 'id', packageName)
    view_sub_value = findViewById(view_sub)
    
    add_leads = resources.getIdentifier('add_leads_id', 'id', packageName)
    add_leads_value = findViewById(add_leads)
    add_leads_value.onClickListener = self
    @basic_details = resources.getIdentifier('basic_details_id', 'id', packageName)
    basic_details_value = findViewById(@basic_details)
    basic_details_value.onClickListener = self
    issue_receipt = resources.getIdentifier('issue_receipt_id', 'id', packageName)
    issue_receipt_value = findViewById(issue_receipt)
    issue_receipt_value.onClickListener = self
    # grid_view = resources.getIdentifier('grid_view_id', 'id', packageName)
    #     grid_view_obj = findViewById(grid_view)
    #     grid_view_obj.setAdapter(ImageAdapter.new(self))
    #     
    #     grid_view_obj.setOnItemClickListener(OnItemClickListener.new)
  end
  
  def onClick(view)
    if view.getId == @basic_details
      puts "butt"
      task = HttpAsyncTask.new(self, 'http://sumerudevserver.cloudapp.net/tatacapitaldev/Token')
      url = ["http://sumerudevserver.cloudapp.net/tatacapitaldev/Token"]
      task.execute(url)
    end
  end
  def update_display(json_data)
    i = Android::Content::Intent.new(self, RegisterActivity)
    i.putExtra(RegisterActivity::DATA, json_data)
    startActivity(i)
  end
end