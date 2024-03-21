# To do locally on Colin's computer, thanks
options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/latest"))
install.packages("remotes")
remotes::install_version("shinyloadtest", "1.1.0")
remotes::install_local(
  Ncpus = 4,
  upgrade = "always",
  force = TRUE
)

unlink("packages.bib", TRUE)
knitr::write_bib(c(
  desc::desc_get_deps()$package
), 'packages.bib')

minifyr::minifyr_npm_install(force = TRUE)
