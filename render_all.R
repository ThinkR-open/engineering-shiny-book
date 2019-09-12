wip <- TRUE
if (wip){
  x <- yaml::read_yaml("_bookdown.yml")
  x$output_dir <- "docs/wip"
  yaml::write_yaml(x, "_bookdown.yml")
}
bookdown::render_book("index.Rmd")
git2r::add(".", ".")
git2r::commit(
  ".", message = sprintf("%s book build", Sys.time())
    )
system("git push")
