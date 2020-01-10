# wip <- TRUE
# if (wip){
#   x <- yaml::read_yaml("_bookdown.yml")
#   x$output_dir <- "docs/wip"
#   yaml::write_yaml(x, "_bookdown.yml")
# }
library(magrittr) 
namer::name_dir_chunks(".")
bookdown::render_book("index.Rmd", output_dir = "docs")
rsconnect::writeManifest("docs")
git2r::add(".", "*")
git2r::commit(
  ".", message = sprintf("%s stable book build", Sys.time())
    )
system("git push")
