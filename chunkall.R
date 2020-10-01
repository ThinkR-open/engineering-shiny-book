lapply(
  list.files(path = ".", pattern = ".Rmd$"), 
  function(x){
    namer::unname_all_chunks(x)
    namer::name_chunks(x)
  }
)