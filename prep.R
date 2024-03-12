# To do locally on Colin's computer, thanks
options(renv.config.mran.enabled = FALSE)
renv::restore()
# remotes::install_local(Ncpus = 4, upgrade = "never", force = TRUE)
if (!file.exists("packages.bib")){
  knitr::write_bib(c(
    desc::desc_get_deps()$package
  ), 'packages.bib')
}

minifyr::minifyr_npm_install(force=TRUE)