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
remotes::install_local()
