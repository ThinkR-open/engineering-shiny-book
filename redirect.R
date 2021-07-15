install.packages("fs")
install.packages("yaml")

redirects <- yaml::read_yaml("_output.yml")$redirects

make_redirect <- function(from, to){
  html <- sprintf(
    '<head><meta http-equiv="refresh" content="0; URL=%s.html" /></head>', 
    to
  )
  dest <- fs::path("_site", from, ext = "html")
  fs::file_create(dest)
  write(html, dest)
}

mapply(make_redirect, from = names(redirects), to = redirects)

# make_redirect_apps <- function(name, url){
#   fs::dir_create(
#     fs::path(
#       "redirects", 
#       name
#     )
#   )
#   fls <- fs::path(
#     "_site", 
#     name, 
#     "index.html"
#   )
#   fs::file_create(
#     fls
#   )
#   write(file = fls, 
#         sprintf('<head><meta http-equiv="refresh" content="0; URL=%s" /></head>', url)
#   )
# }

# make_redirect_apps("tidytuesday201942", "https://connect.thinkr.fr/tidytuesday201942/")
# make_redirect_apps("hexmake", "https://connect.thinkr.fr/hexmake/")
# make_redirect_apps("minifying", "https://connect.thinkr.fr/minifying/")
# make_redirect_apps("golemhtmltemplate", "https://connect.thinkr.fr/golemhtmltemplate/")
# make_redirect_apps("shinipsumdemo", "https://connect.thinkr.fr/shinipsumdemo/")
# make_redirect_apps("databasedemo", "https://connect.thinkr.fr/databasedemo/")
# make_redirect_apps("graysacle", "https://connect.thinkr.fr/graysacle/")
# make_redirect_apps("bs4dashdemo", "https://connect.thinkr.fr/bs4dashdemo/")
# make_redirect_apps("shinyfuture", "https://connect.thinkr.fr/shinyfuture/")

# Creating the redirect
unlink("redirects", TRUE, TRUE)

make_redirect <- function(name, url){
  fs::dir_create(
    fs::path(
      "redirects", 
      name
    )
  )
  fls <- fs::path(
    "redirects", 
    name, 
    "index.html"
  )
  fs::file_create(
    fls
  )
  write(file = fls, 
        sprintf('<head><meta http-equiv="refresh" content="0; URL=%s" /></head>', url)
  )
}

make_redirect("tidytuesday201942", "https://connect.thinkr.fr/tidytuesday201942/")
make_redirect("hexmake", "https://connect.thinkr.fr/hexmake/")
make_redirect("minifying", "https://connect.thinkr.fr/minifying/")
make_redirect("golemhtmltemplate", "https://connect.thinkr.fr/golemhtmltemplate/")
make_redirect("shinipsumdemo", "https://connect.thinkr.fr/shinipsumdemo/")
make_redirect("databasedemo", "https://connect.thinkr.fr/databasedemo/")
make_redirect("graysacle", "https://connect.thinkr.fr/grayscale/")
make_redirect("grayscale", "https://connect.thinkr.fr/grayscale/")
make_redirect("bs4dashdemo", "https://connect.thinkr.fr/bs4dashdemo/")
make_redirect("shinyfuture", "https://connect.thinkr.fr/shinyfuture/")

try({
  dirs <- list.dirs(
    "redirects"
  )
  dirs <- dirs[!dirs == "redirects"]
  for (i in c(
    dirs
  )){
    fs::dir_copy(
      i, 
      fs::path("_site", basename(i))
    )
  }
})