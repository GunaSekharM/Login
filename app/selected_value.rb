class OnItemSelectedListener 
  def initialize(activity)
    @activity = activity
  end
  
  def onItemSelected(parent, view, position, id)
    @activity.display_city(parent.getItemAtPosition(position))
  end
  
  def onNothingSelected(arg)
  end
end