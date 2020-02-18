html_wip:
	Rscript -e 'if(!dir.exists("docs/wip")){dir.create("docs/wip", recursive = TRUE)}'
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs/wip")'
	cp -fvr css/style.css docs/wip/
	cp -fvr css/thinkr.css docs/wip/
	cp -fvr css/style_gitbook.css docs/wip/
	# cp -fvr images _book/
	# cp -fvr _main.utf8.md docs/wip/main.md
	
html_master:
	Rscript -e 'if(!dir.exists("docs")){dir.create("docs", recursive = TRUE)}'
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", clean = FALSE, output_dir = "docs")'
	cp -fvr css/style.css docs/
	cp -fvr css/thinkr.css docs/
	cp -fvr css/style_gitbook.css docs/
	# cp -fvr images _book/
	# cp -fvr _main.utf8.md docs/wip/main.md
	

build:
	make html
	Rscript -e 'browseURL("docs/wip/index.html")'

pdf:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book")'

md:
	Rscript -e 'bookdown::render_book("index.Rmd", output_format = "bookdown::pdf_book", clean = FALSE)'

install:
	Rscript -e 'install.packages("devtools");devtools::install_github("ThinkR-open/building-shiny-apps-workflow")'

clean:
	Rscript -e "bookdown::clean_book(TRUE)"
	rm -fvr *.log Rplots.pdf _bookdown_files land.sqlite3

cleaner:
	make clean && rm -fvr rsconnect
	rm -frv *.aux *.out  *.toc # Latex output
	rm -fvr *.html # rogue html files
	rm -fvr *utf8.md # rogue md files

