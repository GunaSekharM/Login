class DataStore < Android::Database::SQLite::SQLiteOpenHelper
  DATABASE_NAME = "MyFriendsDatabase"
  
  def initialize(context)
    puts "consructor in database"
    #super(context, Name, Factory, Version)
    #context - this is used to create database
    #name - name of the database file
    #factory - A cursor factory(usually pass nil)
    #Version - the version of database. this number is used to identify if there is an upgrade or downgrade of the database
    #super(context, DATABASE_NAME, nil, 1)
  end
  
  def onUpgrade(db, oldVersion, newVersion)
    #db.execSQL("DROP TABLE IF EXISTS credentials")
    onCreate(db)
  end
  #create
  def onCreate(database)
    puts "table creation"
    database.execSQL("CREATE TABLE credentials(username TEXT, password TEXT)")
  end
  #insert
  def add_credentials(username, password)
    puts "inserting data in table"
    values = ContenValues.new(2)
    values.put("username", username)
    values.put("password", password)
    getWritableDatabase.insert("credentials", "username", values)
  end
  #retrieve
  def get_credentials
    puts "coming here &&&&&&&&&&&"
    cursor = getReadableDatabase.rawQuery("select * from credentials", nil)
    cursor
  end
  
  #deleting all records
  
  def deleteAll
    getWritable.delete("credentials", nil, nil)
  end
  
end