Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", {:controller => "directors", :action => "index"})

  get("/directors/eldest", {:controller => "directors", :action => "wisest"})



  get("/characters", {:controller => "characters", :action => "index"})
  get("/movies", {:controller => "movies", :action => "index"})
  get("/actors", {:controller => "actors", :action => "index"})


end
