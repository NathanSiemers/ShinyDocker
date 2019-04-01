sessionInfo()

local({
r <- getOption("repos")
r["CRAN"] <- "http://cran.cnr.berkeley.edu/"
options(repos = r)
})

qwc = function(...) { as.character( unlist( as.list( match.call() )[ -1 ] ) ) }

install_it = function() {
install.packages( qwc (

ggpubr,
qgraph,
devtools,
RMySQL,
Rtsne,
openssl,
ggthemes,
GGally,
##knitr,
ppcor,
doParallel,
GEOquery,
boot,
grid,
gridExtra,
pheatmap,
plotly,
plyr,
reshape2,
stats,
Biostrings,
DT,
Hmisc,
RCurl,
amap,
bigmemory,
data.table,
doMC,
foreach,
org.Hs.eg.db,
pheatmap,
plot,
plotrix,
psych,
qgraph,
stringdist,
shinyjs,
shinythemes,
glue,
shinycssloaders,
viridis
) ) }

install_it()
