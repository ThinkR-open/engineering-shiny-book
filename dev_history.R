usethis::use_build_ignore("dev_history.R")

# bookdown Imports are in Rmds
# remotes::install_github("ThinkR-open/attachment")
imports <- c("bookdown", attachment::att_from_rmds("."))
attachment::att_to_desc_from_is(path.d = "DESCRIPTION", imports = imports)

# Install dependencies
# attachment::install_if_missing(
#   attachment::att_from_description() 
# )
# ou bien
remotes::install_local(force = TRUE)

# Test
pid <- rstudioapi::terminalExecute(
  'R -e \'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs/wip") \''
)
rstudioapi::terminalKill(pid)


bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs/wip")

