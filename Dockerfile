##FROM rocker/shiny
##FROM rocker/r-ver
FROM rocker/shiny-verse:3.5.3

RUN cat /etc/apt/sources.list

##ADD sources.list /etc/apt/sources.list

##RUN cat /etc/apt/sources.list



##RUN rm -rf /var/lib/apt/lists/* && apt-get clean && \
RUN   apt-get update 

RUN Rscript -e 'print( .libPaths() ) '

RUN ls /usr/local/lib/R/library

RUN ls /usr/local/lib/R/site-library

RUN apt-get install -y \
     sudo gdebi-core  pandoc  pandoc-citeproc  \
     libcairo2-dev   libxt-dev  libjpeg-dev  wget \
      libssl-dev libxml2-dev pandoc psmisc dselect libmariadbclient-dev \
      libcurl4-openssl-dev git


## git removed above
## libcurl4-gnutls-dev removed too

##RUN    apt-get update && \

RUN apt-get install -y \
	libhdf5-dev 

## devtools and Seurat are a pain in the ass, install them first.

## RUN Rscript -e 'install.packages("devtools")'

##RUN Rscript -e 'try(remove.packages("tidyverse, /usr/local/lib/R/library")) '
##RUN Rscript -e 'try(remove.packages("tidyverse, /usr/local/lib/R/site-library")) '
##RUN Rscript -e 'install.packages("tidyverse")'

RUN Rscript -e 'options("BioC_mirror" = "https://bioconductor.org"); setRepositories(ind = 1:2); install.packages("Seurat") '

## install a bunch of packages

ADD r-package-install.R r-package-install.R
RUN Rscript r-package-install.R

## make the custom rsqlite with 32K+ columns supported
## necessary for TCGAGTEX and PC3, etc
RUN Rscript -e 'install.packages("DBI")'
RUN Rscript -e 'remove.packages("RSQLite")'
ADD rsqlite-make.R rsqlite-make.R
RUN Rscript rsqlite-make.R

## make my little 'knitit' package
## old and only kept for some old apps
ADD knitit.copy  knitit
ADD install.knitit.R install.knitit.R
RUN Rscript install.knitit.R

ADD shiny-server.conf /etc/shiny-server/shiny-server.conf


################################################################
## if you need a quick patch, add things like below
## usually a missing libs dev os package

##RUN apt-get update && apt-get install -y libjpeg-dev
##RUN  Rscript -e 'install.packages(c("qgraph", "ggpubr"))'

##RUN  Rscript -e 'install.packages(c("shinydashboard", "ggridges"))'


##RUN    apt-get update && \
##apt-get install -y \
##	webalizer
##





