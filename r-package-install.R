sessionInfo()

## local({
##    r <- getOption("repos");
##    r["CRAN"] <- "https://cran.rstudio.com/"
##    options(repos=r)
## })

qwc = function(...) { as.character( unlist( as.list( match.call() )[ -1 ] ) ) }


install_it = function() {
mylist = ( qwc (
##Biostrings,
DT,
##GEOquery,
GGally,
Hmisc,
RCurl,
Rtsne,
amap,
bigmemory,
boot,
data.table,
doMC,
doParallel,
editData,
foreach,
ggpubr,
ggridges,
ggthemes,
glue,
gridExtra,
gtable,
knitr,
openssl,
org.Hs.eg.db,
pheatmap,
plot,
plotly,
plotrix,
plyr,
pool,
ppcor,
psych,
qgraph,
qlcMatrix,
reshape2,
rmarkdown,
scales,
shinyBS,
shinybusy,
shinycssloaders,
shinydashboard,
shinyjs,
shinythemes,
stringdist,
stringr,
tidyverse,
viridis
) )
  for ( i in mylist ) {
  ##try(remove.packages( i, '/usr/local/lib/R/library') )
  ##try(remove.packages( i, '/usr/local/lib/R/site-library') )
  install.packages(i)
} } 


install_it()
