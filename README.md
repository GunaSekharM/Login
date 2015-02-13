# Login
Using login credentials posting request and getting response from api
Networking part can't run on main thread. we should make it run on another thread
I am using AsyncTask class. Which is used to run on Asynchronous thread and sync with the main thread
This class contains onPreExecute(), doInBackground(params), onProgressUpdate(params) and onPostExecute(result)
I used only two methods i.e doInBackground(Params) which will get hit on execute method and onPostExecute(result) will get hit after getting response from server
we can get display result on UI
