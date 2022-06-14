FROM rocker/shiny-verse:4.2.0

RUN   apt-get update 

RUN apt-get install -y \
     sudo gdebi-core  pandoc  pandoc-citeproc  \
     libcairo2-dev   libxt-dev  libjpeg-dev  wget \
      libssl-dev libxml2-dev pandoc psmisc dselect \
      ##libmariadbclient-dev \
      libmariadb-dev \
      libglpk-dev \
      libcurl4-openssl-dev git webalizer libbz2-dev libhdf5-dev \
      sqlite3 \
      libgeos++-dev libgeos-3.8.0 libgeos-c1v5 libgeos-dev libgeos-doc

################################################################
## install a ton of cran and bioconductor packages, see r-package-install.R
ADD r-package-install.R r-package-install.R
RUN Rscript r-package-install.R

################################################################
## stuff from github
################################################################

RUN Rscript -e  'devtools::install_github("homerhanumat/shinyCustom")'
RUN Rscript -e  'devtools::install_github("hylasD/tSpace", build = TRUE, build_opts = c("--no-resave-data", "--no-manual"), force = T)'

################################################################
## custom rsqlite for legacy shiny server apps.
## make the custom rsqlite with 32K+ columns supported

## necessary for TCGAGTEX and PC3, etc
##RUN Rscript -e 'remove.packages("RSQLite")'

##ADD RSQLite_2.2.7.tar.gz .
##ADD rsqlite-make.R rsqlite-make.R
##RUN Rscript rsqlite-make.R

## make my little 'knitit' package
## only kept for some old apps
ADD knitit.copy  knitit
ADD install.knitit.R install.knitit.R
RUN Rscript install.knitit.R

ADD shiny-server.conf /etc/shiny-server/shiny-server.conf

################################################################
## if you need a quick patch, add things like below
## usually a missing libs dev os package




