# if (!requireNamespace("remotes", lib.loc = libpath, quietly = TRUE)) {
#   install.packages("remotes")
# }
# if (!requireNamespace("renv", lib.loc = libpath, quietly = TRUE)) {
#  remotes::install_github('rstudio/renv')
#}
# R 3.6.3
# options(repos = list(CRAN = 'https://mran.revolutionanalytics.com/snapshot/2019-08-05/'))
options(repos = list(CRAN = 'https://mran.revolutionanalytics.com/snapshot/2020-03-06/'))


source("renv/activate.R")
# renv::activate()

if (dir.exists("/opt/local/renv/cache")) {
  Sys.setenv(RENV_PATHS_CACHE = "/opt/local/renv/cache")
  renv::settings$use.cache(TRUE)
} else if (dir.exists("/mnt/Data/renv_cache")) {
  Sys.setenv(RENV_PATHS_CACHE = "/mnt/Data/renv_cache")
  renv::settings$use.cache(TRUE)
} else {
  renv::settings$use.cache(FALSE)
}
