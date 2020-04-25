FROM rocker/r-ver:3.6.1
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libssh2-1-dev libssl-dev libxml2-dev make zlib1g-dev && rm -rf /var/lib/apt/lists/*
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl')" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'
RUN R -e 'remotes::install_github("r-lib/remotes", ref = "97bbf81")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3")'
RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.4.0")'
RUN Rscript -e 'remotes::install_github("thinkr-open/golem@bf9d0411e337d80d878ed62168360f920668acc2")'
RUN Rscript -e 'remotes::install_github("rstudio/htmltools@e07546ccb476a3f1c5cbe6178424635a886f8008")'
RUN Rscript -e 'remotes::install_github("rstudio/rstudioapi@66e81da53485b036794f2e737b26ed3d53557013")'
RUN Rscript -e 'remotes::install_github("r-lib/fastmap@61c609993a40b8101b141b2c940bf8ccbaef4dfa")'
RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'remotes::install_local(upgrade="never")'
EXPOSE 80
CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');golex::run_app()"
