## Contributing 

First of all, thank you for taking time to read our book!

### What you can help with

There are two ways to contribute to the book: 

+ Spot typos and / or mistakes in the text or in the code blocks

+ Contribute written content 

### How to

+ Open an issue with the content and / or with the error you have spotted

+ If you want to make written contribution, please open a pull request with your correction / contribution 

  + In that case, please include as a comment to your pull request "I assign the 
      copyright of this contribution to Colin Fay, Vincent Guyader, Cervan Girard and 
      Sébastien Rochette". This will be needed for the publication of the printed 
      book.
  
  + Add your name in the Acknowledgment section in the introduction.

+ If you want to contribute written content, you might want to open an issue first so that we can discuss the topic first.

## Building

### Build the book locally with existing cache

This requires Docker, Node and multiple dependencies installed using {renv}.
By default, this will use the cache to restore outputs.

*hexmake*
```sh
docker pull colinfay/hexmake
```

*minifyr*
```sh
sudo apt-get -y install curl 
sudo apt-get install -y nodejs

Rscript -e 'remotes::install_github("colinfay/minifyr")' 
Rscript -e 'remotes::install_cran("cicerone")' 
# Verify it works
Rscript -e 'library(minifyr);
        minifyr_npm_install(TRUE);
        minify_package_js("cicerone", minifyr_js_uglify)'
```

Then you can build it in a Terminal
```sh
Rscript prep.R
Rscript -e 'bookdown::render_book("index.Rmd")'
Rscript -e 'browseURL("_site/index.html")'
```

### Update the list of dependencies in DESCRIPTION

```sh
Rscript -e 'source("before-build.R")'
```

### Update versions of packages in {renv}

```sh
Rscript -e 'renv::snapshot()'
```

### Recreate datasets

Run the content of 'render_all.R'
