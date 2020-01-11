sessionInfo()

local({
r <- getOption("repos")
r["CRAN"] <- "http://cran.cnr.berkeley.edu/"
options(repos = r)
})

qwc = function(...) { as.character( unlist( as.list( match.call() )[ -1 ] ) ) }

install_it = function() {
install.packages( qwc (


<<<<<<< HEAD
=======
install.packages('devtools')
install.packages('Rtsne')
install.packages('openssl')
install.packages('ggthemes')
install.packages('ggplot2')
install.packages('GGally')
install.packages('knitr')
install.packages('ppcor')
install.packages("doParallel")
install.packages('GEOquery')
install.packages('boot')
install.packages('grid')
install.packages('gridExtra')
install.packages('pheatmap')
install.packages('plotly')
install.packages('plyr')
install.packages('ppcor')
install.packages('reshape2')
install.packages('stats')
install.packages('Biostrings')
install.packages('DT')
install.packages('Hmisc')
install.packages('RCurl')
install.packages('amap')
install.packages('bigmemory')
install.packages('data.table')
install.packages('doMC')
install.packages('foreach')
install.packages('knitr')
install.packages('rmarkdown')
install.packages('magrittr')
install.packages('org.Hs.eg.db')
install.packages('pheatmap')
install.packages('plot')
install.packages('plotly')
install.packages('plotrix')
install.packages('plyr')
install.packages('ppcor')
install.packages('psych')
install.packages('qgraph')
install.packages('reshape2')
install.packages('rmarkdown')
install.packages('stringdist')
##install.packages('shiny', repos='https://cran.rstudio.com/')
install.packages('shinythemes')
install.packages('glue')
install.packages('shinycssloaders')
>>>>>>> b0f934da879ce1f5fd4da5ac46131d33930c780b

devtools,
Biostrings,
DT,
GEOquery,
GGally,
Hmisc,
RCurl,
RMySQL,
Rtsne,
amap,
bigmemory,
boot,
data.table,
devtools,
doMC,
doParallel,
foreach,
ggpubr,
ggthemes,
glue,
grid,
gridExtra,
openssl,
org.Hs.eg.db,
pheatmap,
pheatmap,
plot,
plotly,
plotrix,
plyr,
ppcor,
psych,
qgraph,
reshape2,
shinycssloaders,
shinyjs,
shinythemes,
stats,
stringdist,
viridis,
Seurat,
qlcMatrix,
pool,
tidyverse,
shinydashboard,
ggridges


) ) }

install_it()
