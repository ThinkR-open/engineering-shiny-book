#install.packages(c("attachment", "remotes", "usethis", "namer", "desc"))
paks <- c(
  attachment::att_from_rmds(".", recursive = FALSE), 
  'bookdown', 'knitr', 'rmarkdown', 'tidyverse', 
  'testthat', 'usethis', 'config', 'hexmake', 'shinyalert', 
  'plotly', 'shinyMobile', 'resume', 'nessy','skeleton',
  'fullPage', 'bs4Dash', 'shinydashboardPlus', 
  'sf', 'devtools', 'crrri', 'chromote', 
  'crrry', 'shinytest', 'processx', 
  'renv', 'geojsonsf', 'pkgbuild', 'profvis', 
  'gargoyle', 'dplyr', 'dbplyr', 'vroom',
  'data.table', 'jsonlite', 'readxl', 
  'R.cache', 'glouton', 'bubble'
)
#cran_paks <- tools::CRAN_package_db()
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

knitr::write_bib(c(
  paks
), 'packages.bib')

lapply(
  list.files(path = ".", pattern = ".Rmd$"), 
  function(x){
    namer::unname_all_chunks(x)
    namer::name_chunks(x)
  }
)
