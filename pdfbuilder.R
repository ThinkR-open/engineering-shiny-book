# options(bookdown.post.latex = function(string){
#   string <- gsub(
#     "(\\\\section\\*\\{)", 
#     "\\1\\\\color{bluethinkr} ",
#     string
#   )
# 
#   string <- gsub(
#     "(\\\\chapter\\*\\{)", 
#     "\\1\\\\color{orangethinkr} ",
#     string
#   )
#   string
# })
bookdown::render_book("index.Rmd", "bookdown::pdf_book") %>% browseURL()
