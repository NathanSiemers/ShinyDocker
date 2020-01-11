sessionInfo()

local({
   r <- getOption("repos");
   r["CRAN"] <- "https://cran.rstudio.com/"
   options(repos=r)
})

qwc = function(...) { as.character( unlist( as.list( match.call() )[ -1 ] ) ) }

install_it = function() {
install.packages( qwc (

Biostrings,
DT,
GEOquery,
GGally,
GGally,
Hmisc,
RColorBrewer,
RCurl,
RCurl,
RMySQL,
Rtsne,
Rtsne,
Seurat,
amap,
bigmemory,
boot,
data.table,
devtools,
devtools,
doMC,
doParallel,
editData,
forcats,
foreach,
ggplot2,
ggpubr,
ggridges,
ggridges,
ggthemes,
glue,
gridExtra,
gtable,
knitr,
magrittr,
openssl,
openssl,
org.Hs.eg.db,
pheatmap,
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

) ) }


install_it()
