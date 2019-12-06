usethis::use_build_ignore("dev_history.R")

# bookdown Imports are in Rmds
imports <- c("bookdown", attachment::att_from_rmds("."))
# remotes::install_github("ThinkR-open/attachment")
attachment::att_to_desc_from_is(path.d = "DESCRIPTION", imports = imports)

# Install dependencies
# attachment::install_if_missing(
#   attachment::att_from_description() 
# )
# ou bien
remotes::install_local()
