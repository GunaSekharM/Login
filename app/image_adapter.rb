class ImageAdapter < Android::Widget::BaseAdapter
  attr_accessor :activity
  def initialize(activity)
    @activity = activity
  end
  
  # mThumbIds = Array.new(7)
  #   mThumbIds.add("a")
  #   mThumbIds.add("b")
  #   mThumbIds.add("Android::R::Drawable.change_password")
  #   mThumbIds.add("c")
  #   mThumbIds.add("d")
  #   mThumbIds.add("e")
  #   mThumbIds.add("f")
  #   mThumbIds.add("g")
  
  def getCount
    7
  end
  
  def getItem(position)
    position
  end
  
  def getItemId(position)
    position
  end
  
  def getView(position, convertView, parent)
    if convertView == nil
      # mThumbIds = Array.new(7)
      #       mThumbIds.add(Android::R::Drawable::add_lead)
      #       mThumbIds.add(Android::R::Drawable::change_password)
      #       mThumbIds.add(Android::R::Drawable::basic_details)
      #       mThumbIds.add(Android::R::Drawable::change_password)
      #       mThumbIds.add(Android::R::Drawable::search_account)
      #       mThumbIds.add(Android::R::Drawable::top_accounts)
      #       mThumbIds.add(Android::R::Drawable::issue_receipt)
      #       puts mThumbIds
      #mThumbIds = [1,2,3,4,5,6,7]
      drawable_value = Android::R::Drawable
      puts drawable_value
      mThumbIds = [drawable_value::add_lead, drawable_value::change_password, drawable_value::basic_details, drawable_value::change_password, drawable_value::search_account, drawable_value::top_accounts, drawable_value::issue_receipt]
      puts mThumbIds[position]
      imageView = Android::Widget::ImageView.new(activity)
      #imageView.setImageResource(mThumbIds[position])
      imageView.setLayoutParams(Android::Widget::AbsListView::LayoutParams.new(85, 85))
      imageView.setScaleType(Android::Widget::ImageView::ScaleType::CENTER_CROP)
      imageView.setPadding(8, 8, 8, 8)
    else
      imageView = convertView
    end
    imageView
  end
end