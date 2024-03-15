options(usethis.allow_nested_project = TRUE)
library(magrittr)
unlink("golex", TRUE, TRUE)
golem::create_golem("golex", open = FALSE)
golem::add_module(name = "my_first_module", here::here("golex"), open = FALSE)
golem::add_js_handler("first_handler", here::here("golex"), open = FALSE)
golem::add_js_file("script", here::here("golex"), open = FALSE)
golem::add_js_handler("script", here::here("golex"), open = FALSE)
golem::add_css_file("custom", here::here("golex"), open = FALSE)



