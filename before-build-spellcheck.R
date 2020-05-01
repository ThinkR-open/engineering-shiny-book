if (!requireNamespace("gh")){
  install.packages("gh")
}
if (!requireNamespace("spelling")){
  install.packages("spelling")
}
if (!requireNamespace("knitr")){
  install.packages("knitr")
}
try({
  gh::gh(
    "POST /repos/:owner/:repo/issues",
    owner = gsub("([^/]*)/.*", "\\1", Sys.getenv("GITHUB_REPOSITORY")),
    repo = gsub("[^/]*/(.*)", "\\1", Sys.getenv("GITHUB_REPOSITORY")),
    title = sprintf(
      "Spellcheck GA %s - %s", 
      Sys.getenv("GITHUB_ACTION"), Sys.Date()
    ), 
    .token = Sys.getenv("GH_TOKEN"),
    body = paste(
      capture.output(
        knitr::kable(
          do.call(
            rbind, 
            lapply(
              list.files(
                path = ".", 
                pattern = ".Rmd$"
              ), 
              function(x){
                spelling::spell_check_files(x)
              }
            )
          )
        )
      ),
      collapse = "\n"
    )
  )
})

