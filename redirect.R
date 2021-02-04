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