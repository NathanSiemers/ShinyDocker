FROM rocker/shiny-verse

RUN cat /etc/apt/sources.list

ADD sources.list /etc/apt/sources.list

RUN cat /etc/apt/sources.list


##RUN rm -rf /var/lib/apt/lists/* && apt-get clean && \
RUN    apt-get update && \
apt-get install -y \
     sudo \
     gdebi-core \
     pandoc \
     pandoc-citeproc \
     libcurl4-gnutls-dev \
     libcairo2-dev \
     libxt-dev \
     wget \
 libssl-dev libxml2-dev pandoc psmisc git dselect libmariadbclient-dev

ADD shiny-server.conf /etc/shiny-server/shiny-server.conf

ADD r-package-install.R r-package-install.R
RUN Rscript r-package-install.R

ADD rsqlite-make.R rsqlite-make.R
RUN Rscript rsqlite-make.R

ADD knitit knitit
ADD install.knitit.R install.knitit.R
RUN Rscript install.knitit.R

## fixes to add to masters later

RUN apt-get update && apt-get install -y libjpeg-dev
RUN  Rscript -e 'install.packages(c("qgraph", "ggpubr"))'










