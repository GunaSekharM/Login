class ListViewActivity < Android::App::Activity
  DATA = "com.yourcompany.helloworld.json_data"
  def onCreate(savedInstanceState)
    super
    self.contentView = Android::R::Layout::list_view.xml
    listView = findViewById(Android::R::Id::list_view)
    
    values = self.intent.getStringExtra(DATA)
    json_obj = Org::Json::JSONObject.new(values)
    
    myList = Array.new(3)
    map = Java::Util::HashMap.new
    map.put("id", "ID")
    map.put("id_value", json_obj.getString("id"))
    myList.add(map)
    map = Java::Util::HashMap.new
    map.put("id", "FirstName")
    map.put("id_value", json_obj.getString("firstName"))
    myList.add(map)
    map = Java::Util::HashMap.new
    map.put("id", "PhoneNumber")
    map.put("id_value", json_obj.getString("primaryMobileNumber"))
    myList.add(map)
    puts Android::R::Layout::row
    keys = ["id", "id_value"]
    values = [Android::R::id::key, Android::R::id::value]
    data = Android::widget::SimpleAdapter.new(self, myList, Android::R::Layout::row , keys, values)
    listView.setAdapter(data) 
  end
end