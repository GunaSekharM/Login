class ImageAdapter < Android::Widget::BaseAdapter
  attr_accessor :activity
  def initialize(activity)
    @activity = activity
  end
  puts Android::R::Drawable
  #mThumbIds = [Android::R::Drawable.new.add_lead, Android::R::Drawable.change_password, Android::R::Drawable.basic_details, Android::R::Drawable.change_password, Android::R::Drawable.search_account, Android::R::Drawable.top_accounts, Android::R::Drawable.issue_receipt]
  
  def getCount
    #mThumbIds.count
  end
  
  def getItem(position)
    nil
  end
  
  def getItemId(position)
    0
  end
  
  def getView(position, convertView, parent)
    if convertView == nil
      imageView = Android::Widget::ImageView.new(activity)
      #imageView.setLayoutParams(Android::Widget::GridView.new.LayoutParams(85, 85))
      imageView.setScaleType(Android::Widget::ImageView::ScaleType::CENTER_CROP)
      imageView.setPadding(8, 8, 8, 8)
    else
      imageView = convertView
    end
    imageView
  end
end