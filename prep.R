options(repos = c(
  "https://packagemanager.posit.co/cran/__linux__/jammy/latest",
  "https://cloud.r-project.org"
))
install.packages("remotes")
remotes::install_cran("pak")
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
