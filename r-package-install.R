sessionInfo()

local({
r <- getOption("repos")
r["CRAN"] <- "http://cran.cnr.berkeley.edu/"
options(repos = r)
})

qwc = function(...) { as.character( unlist( as.list( match.call() )[ -1 ] ) ) }

install_it = function() {
install.packages( qwc (



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
qgraph,
reshape2,
shinycssloaders,
shinyjs,
shinythemes,
stats,
stringdist,
viridis
) ) }

install_it()
