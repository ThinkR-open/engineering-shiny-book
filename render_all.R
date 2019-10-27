# wip <- TRUE
# if (wip){
#   x <- yaml::read_yaml("_bookdown.yml")
#   x$output_dir <- "docs/wip"
#   yaml::write_yaml(x, "_bookdown.yml")
# }
bookdown::render_book("index.Rmd", output_dir = "docs")
git2r::add(".", "docs")
git2r::commit(
  ".", message = sprintf("%s stable book build", Sys.time())
    )
system("git push")
