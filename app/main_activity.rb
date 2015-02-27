class MainActivity < Android::App::Activity
  def onCreate(savedInstanceState)
    super
    self.requestWindowFeature(Android::View::Window::FEATURE_NO_TITLE)
    #getWindow.getDecorView.setSystemUiVisibility(Android::View::View::SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
    layout = resources.getIdentifier('hello', 'layout', packageName)
    self.contentView = layout
    
    title_image = resources.getIdentifier('title_image_id', 'id', packageName)
    findViewById(title_image)
    
    symbol_image = resources.getIdentifier('symbol_image_id', 'id', packageName)
    findViewById(symbol_image)
    
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
    
    @register_id = resources.getIdentifier('register', 'id', packageName)
    register_button = findViewById(@register_id)
    register_button.onClickListener = self
    
    image_view_id = resources.getIdentifier('image_view', 'id', packageName)
    @image_view_value = findViewById(image_view_id)
    
    #image_button_id = resources.getIdentifier('image_button', 'id', packageName)
    #image_button_value = findViewById(image_button_id)
  end
  
  def onClick(view)
    if view.getId == @button_id
      if @text_box.getText.toString == "capfirst123" && @text_box_value.getText.toString == "tatacap@yopmail.com"
        i = Android::Content::Intent.new(self, DashboardActivity)
        user_name = @text_box_value.getText.toString
        password = @text_box.getText.toString
        i.putExtra(DashboardActivity::USERNAME, user_name)
        i.putExtra(DashboardActivity::PASSWORD, password)
        startActivity(i)
      else
        Android::Widget::Toast::makeText(self, "UserName and Password are incorrect", Android::Widget::Toast::LENGTH_SHORT).show
      end
    elsif view.getId == @register_id
      cameraIntent = Android::Content::Intent.new(Android::Provider::MediaStore::ACTION_IMAGE_CAPTURE)
      cameraIntent.putExtra("crop", true)
      cameraIntent.putExtra("aspectX", 0)
      cameraIntent.putExtra("aspectY", 0)
      cameraIntent.putExtra("outputX", 200)
      cameraIntent.putExtra("outputY", 150)
      startActivityForResult(cameraIntent, 0)
    end
  end
  
  def onActivityResult(requestCode, resultCode, data)
    if requestCode == 0 && resultCode = RESULT_OK
      photo = data.getExtras.get("data")
      @image_view_value.setVisibility(0)
      #bm = Android::Graphics::BitmapFactory::decodeResource(getResouces, photo)
      #resized = Android::Graphics::Bitmap::createScaledBitmap(bm, 100, 100, true)
      #conv_bm = getRoundedRectBitmap(resized, 100)
      #puts conv_bm
      @image_view_value.setImageBitmap(photo)
    end
  end
  
  def getRoundedRectBitmap(bitmap, pixels)
    puts "coming here&&&&&&&&&&&&"
    result = Android::Graphics::Bitmap::createBitmap(200, 200, Android::Graphics::Bitmap::Config::ARGB_8888)
    canvas = Android::Graphics::Canvas.new(result)
    color = 0xff424242
    paint = Android::Graphics::Paint.new
    rect = Android::Graphics::Rect.new(0, 0, 200, 200)
    paint.setAntiAlias(true)
    canvas.drawARGB(0, 0, 0, 0)
    paint.setColor(color)
    canvas.drawCircle(50, 50, 50, paint)
    paint.setXfermode(Android::Graphics::PorterDuffXfermode(Mode::SRC_IN))
    canvas.drawBitmap(bitmap, rect, rect, paint)
    result
  end
  
  # def getRoundedShape(scaleBitMapImage)
  #     targetWidth = 50
  #     targetHeight = 50
  #     targetBitmap = Android::Graphics::Bitmap::createBitmap(targetWidth, targetHeight, Android::Graphics::Bitmap::Config::ARGB_8888)
  #     canvas = Android::Graphics::Canvas.new(targetBitmap)
  #     path = Android::Graphics::Path.new
  #     path.addCircle((targetWidth - 1) / 2, (targetHeight - 1) / 2, Java::Lang::Math::min(targetWidth, targetHeight) / 2), Android::Graphics::Path::Direction::CCW)
  #     canvas.clipPath(path)
  #     sourceBitmap = scaleBitmapImage
  #     canvas.drawBitmap(sourceBitmap, Android::Graphics::Rect.new(0, 0, sourceBitmap.getWidth, sourceBitmap.getHeight), Android::Graphics::Rect.new(0, 0, targetWidth, targetHeight), nil)
  #     targetBitmap
  #   end
end

# data_base = MyDatabaseHelper.new(self)
#       data_base.add_credentials(@text_box_value.getText.toString, @text_box.getText.toString)
#       puts data_base.get_credentials
#       puts @text_box_value.getText.toString
#task = APILoad.new
#task.execute("http://sumerudevserver.cloudapp.net/tatacapitaldev/Token")
