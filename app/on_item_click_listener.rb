class OnItemClickListener
  def onItemClick(paremt, view, position, id)
    Android::Widget::Toast.makeText("you clicked" + position, Android::Widget::Toast::LENGTH_SHORT).show
  end
end