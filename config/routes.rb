Rails.application.routes.draw do
  get("/", {:controller => "user", :action => "list"})
  get("/users", {:controller => "user", :action => "list"})
  post("/create_user", {:controller => "user", :action => "create"})

  get("/users/:username", {:controller => "user", :action => "detail"})
  post("/update_user/:username", {:controller => "user", :action => "update"})

  get("/photos", {:controller => "photo", :action => "list"})
  post("/create_photo", {:controller => "photo", :action => "create"})


  get("/photos/:photo_id", {:controller => "photo", :action => "detail"})
  post("/update_photo/:photo_id", {:controller => "photo", :action => "update"})
  post("/create_comment", {:controller => "comment", :action => "create"})

  get("/delete_photo/:toast_id", { :controller => "photo", :action => "delete"})
end
