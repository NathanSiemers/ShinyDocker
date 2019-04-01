FROM rocker/shiny-verse

RUN cat /etc/apt/sources.list

ADD sources.list /etc/apt/sources.list

RUN cat /etc/apt/sources.list

ADD shiny-server.conf /etc/shiny-server/shiny-server.conf

##RUN rm -rf /var/lib/apt/lists/* && apt-get clean && \
RUN    apt-get update && \
apt-get install -y \
     sudo gdebi-core  pandoc  pandoc-citeproc libcurl4-gnutls-dev \
     libcairo2-dev   libxt-dev  libjpeg-dev  wget \
      libssl-dev libxml2-dev pandoc psmisc git dselect libmariadbclient-dev

ADD r-package-install.R r-package-install.R
RUN Rscript r-package-install.R

ADD rsqlite-make.R rsqlite-make.R
RUN Rscript rsqlite-make.R

ADD knitit.copy  knitit
ADD install.knitit.R install.knitit.R
RUN Rscript install.knitit.R


################################################################
## if you need a quick patch, add things like below
## usually a missing libs dev os package

##RUN apt-get update && apt-get install -y libjpeg-dev
##RUN  Rscript -e 'install.packages(c("qgraph", "ggpubr"))'










