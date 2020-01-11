FROM rocker/shiny-verse

##RUN cat /etc/apt/sources.list

##ADD sources.list /etc/apt/sources.list

##RUN cat /etc/apt/sources.list


##RUN rm -rf /var/lib/apt/lists/* && apt-get clean && \

##RUN    apt-get update && \


RUN apt-get install -y \
     sudo gdebi-core  pandoc  pandoc-citeproc libcurl4-gnutls-dev \
     libcairo2-dev   libxt-dev  libjpeg-dev  wget \
      libssl-dev libxml2-dev pandoc psmisc dselect libmariadbclient-dev
## git removed above
##RUN    apt-get update && \

RUN apt-get install -y \
	libhdf5-dev 

## devtools and Seurat are a pain in the ass, install them first.

## RUN Rscript -e 'install.packages("devtools")'

RUN Rscript -e 'options("BioC_mirror" = "https://bioconductor.org"); setRepositories(ind = 1:2); install.packages("Seurat") '

## install a bunch of packages

ADD r-package-install.R r-package-install.R
RUN Rscript r-package-install.R

## make the custom rsqlite with 32K+ columns supported
## necessary for TCGAGTEX and PC3, etc
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





