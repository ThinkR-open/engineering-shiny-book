# -- Update indices before rendering -- #
# /!\ long calculation /!\
if (!dir.exists(here::here("dataset"))) {dir.create(here::here("dataset"))}

library(dplyr)

## cyclocomp
library(cyclocomp)
## _golex
source(here::here("golembuild.R"))
remotes::install_local("golex", upgrade = "never")
cyclo_golex <- cyclocomp_package("golex")
remove.packages("golex")
source(here::here("golemdestroy.R"))
readr::write_rds(cyclo_golex, here::here("dataset", "cyclo_golex.rds"))
## _tidytuesday
cyclo_tidytuesday <- cyclocomp_package("tidytuesday201942")
readr::write_rds(cyclo_tidytuesday, here::here("dataset", "cyclo_tidytuesday.rds"))
## _shiny
cyclo_shiny <- cyclocomp_package("shiny")
readr::write_rds(cyclo_shiny, here::here("dataset", "cyclo_shiny.rds"))


## frame_metrics
library(packageMetrics2)
frame_metric <- function(pkg){
  metrics <- package_metrics(pkg)
  tibble::tibble(
    n = names(metrics), 
    val = metrics, 
    expl = list_package_metrics()[names(metrics)]
  )
}
## _golem
frame_golem <- frame_metric("golem")
readr::write_rds(frame_golem, here::here("dataset", "frame_golem.rds"))
## _shiny
frame_shiny <- frame_metric("shiny")
readr::write_rds(frame_shiny, here::here("dataset", "frame_shiny.rds"))


# --- Build book --- #
# wip <- TRUE
# if (wip){
#   x <- yaml::read_yaml("_bookdown.yml")
#   x$output_dir <- "docs/wip"
#   yaml::write_yaml(x, "_bookdown.yml")
# }
library(magrittr) 
namer::name_dir_chunks(".")
bookdown::render_book("index.Rmd", output_dir = "docs")
file.copy("css/style.css", "docs/")
file.copy("css/thinkr.css", "docs/")
file.copy("css/style_gitbook.css", "docs/")

rsconnect::writeManifest("docs")
git2r::add(".", "*")
git2r::commit(
  ".", message = sprintf("%s stable book build", Sys.time())
    )
system("git push")
