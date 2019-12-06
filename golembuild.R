library(magrittr)
unlink("golex", TRUE, TRUE)
golem::create_golem("golex", open = FALSE)
golem::add_js_handler("plop", "golex", open = FALSE)
