# To do locally on Colin's computer, thanks
options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/latest"))
renv::restore()
# remotes::install_local(Ncpus = 4, upgrade = "never", force = TRUE)
if (!file.exists("packages.bib")){
  knitr::write_bib(c(
    desc::desc_get_deps()$package
  ), 'packages.bib')
}
