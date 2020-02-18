usethis::use_build_ignore("dev_history.R")

# bookdown Imports are in Rmds
# remotes::install_github("ThinkR-open/attachment")
imports <- unique(c(
  "bookdown", 
  # Calls in `r code`
  "devtools", "knitr", "lubridate", 
  # Do not know why it is needed...
  "future",
  attachment::att_from_rmds(".", recursive = FALSE))
)
attachment::att_to_desc_from_is(path.d = "DESCRIPTION", imports = imports)

# Install dependencies
# attachment::install_if_missing(
#   attachment::att_from_description() 
# )
# ou bien
remotes::install_github("ThinkR-open/golem")
remotes::install_local(force = TRUE)

# Test
pid <- rstudioapi::terminalExecute(
  'R -e \'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs/wip") \''
)
rstudioapi::terminalKill(pid)


bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs/wip")

