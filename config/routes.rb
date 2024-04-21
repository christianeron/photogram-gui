Rails.application.routes.draw do

  get("/users", {:controller => "user", :action => "list"})

  get("/users/:username", {:controller => "user", :action => "detail"})

  get("/photos", {:controller => "photo", :action => "list"})

  get("/photos/:photo_id", {:controller => "photo", :action => "detail"})

end
