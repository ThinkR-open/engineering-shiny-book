# To do locally on Colin's computer, thanks
options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/latest"))

remotes::install_github("lbartnik/subprocess")
remotes::install_github("rstudio/websocket")
paks <- c(
  "cloc", "dplyr", "cyclocomp", "tidytuesday201942", "shiny", "packageMetrics2", 
  "remotes", "readr", "here", "tibble", "knitr", "desc", "attachment", "magrittr", 
  "tools", "fs", "glue", "dichromat", "purrr", "htmltools", "matlab", "viridis", 
  "golem", "shinipsum", "ggplot2", "DT", "fakir", "shinyloadtest", "dockerstats", 
  "attempt", "dockerfiler", "Rcpp", "profmem", "bench", "jsonlite", "cli", "memoise", 
  "tictoc", "promises", "future", "liteq", "DBI", "RSQLite", "xfun", 
  'bookdown', 'knitr', 'rmarkdown', 'tidyverse', 
  'testthat', 'usethis', 'config', 'hexmake', 'shinyalert', 
  'plotly', 'shinyMobile', 'resume', 'nessy','skeleton',
  'fullPage', 'bs4Dash', 'shinydashboardPlus', 
  'sf', 'devtools', 'crrri', 
  'chromote', 
  'crrry', 'shinytest', 'processx', 
  'renv', 'geojsonsf', 'pkgbuild', 'profvis', 
  'gargoyle', 'dplyr', 'dbplyr', 'vroom',
  'data.table', 'jsonlite', 'readxl', 
  'R.cache', 'glouton', 'bubble', 'roxygen2', 
  'covr', 'rcmdcheck', 'covrpage', 
  'dccvalidator', 'minifyr', 'sever', 'shinyFeedback', 
  "whereami", "RcppSimdJson", "foreign", "haven", 
  "tidymodules", "shinyjs", "htmlwidgets", 
  "hunspell", "rhub", "spelling", "tufte", "uuid", 
  "attachment", "remotes", "usethis", "namer", "desc", "spelling", "tufte"
) 
paks <- unique(paks)

cran_paks <- tools::CRAN_package_db()
desc_pak <- desc::desc_get_deps()$package

for (pak in paks){
  if ( !(pak %in% desc_pak)){
    try({
      if (pak %in% cran_paks$Package){
        usethis::use_package(pak)
      } else {
        usethis::use_dev_package(pak)
      } 
    })
  }
}

usethis::use_tidy_description()
renv::restore()
remotes::install_local(Ncpus = 4, upgrade = "never", force = TRUE)

knitr::write_bib(c(
  unique(paks)
), 'packages.bib')

purrr::walk(
  list.files(path = ".", pattern = ".Rmd$"), 
  function(x){
    cli::cat_rule(x)
    namer::name_chunks(x)
  }
)

