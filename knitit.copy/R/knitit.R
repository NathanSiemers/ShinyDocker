library(knitr)

#' knit an Rmd file into a word docx file
#'
#' @param filname input Rmd file minus the '.Rmd'
#' @param nerd.report show code and results by default? (you can override any block yourself)
#' @param myeval evaluate code in blocks by default (possibly useful for debugging)
#' @param format  'portrait' or 'landscape'  if you supply your own docx template this will be ignored
#' @param template docx file to be used as template for word document creation
#' @param mk.dir  make a Reports directory under current wd and place .md and .docx files there?
#' @param figwidth default fig.width for graphics
#' @param fixheight default fig.height for graphics
#' @param date.it add date string to output docx file name
#'
#' @return name of docx file produced
#'
#' @export
#' knitit
#'
#'
#'
#'

knitit = function(filename = filename, withgenes=FALSE, nerd.report=FALSE, myeval=TRUE, format='portrait', template = NULL, mk.dir = TRUE, figwidth = 7, figheight = 5, date.it = TRUE, out.file = NULL){
    if (! is.null(template) ) {
        figwidth=figwidth; figheight = figheight; docx = template
        } else {
            if (format == 'landscape') {
                figwidth=10; figheight=5.5; docx = system.file('reference-landscape.docx', package = 'knitit')
            }
            if (format == 'portrait') {
                docx = system.file('reference-portrait.docx', package = 'knitit')
            }
        }

    if(nerd.report) {
        myresults = 'show'; myecho = TRUE; mywarning = TRUE; mymessage = TRUE
    } else {
        myresults = 'hide'; myecho=FALSE; mywarning = FALSE; mymessage=FALSE
    }
    if( withgenes == FALSE) {
        genestring = ""
    }
    else {
        genestring = paste(withgenes, collapse=".")
    }
    if(nerd.report) {
        nerdstring = "nerd"
    } else {
        nerdstring = NULL
    }
    if ( mk.dir ) {
        system('mkdir Reports')
        report.loc = 'Reports/'
    } else {
        report.loc = ''
    }
    rmdfile = paste(filename, ".Rmd", sep="")
    mdfile = paste(report.loc, genestring , filename, ".md", sep="")
    if(date.it) {
        my.date = Sys.Date()
    } else {
        my.date = NULL
    }
    if( is.null(out.file) ) {
        my.strings = c(genestring,  filename, nerdstring,  my.date,  "docx")
        my.strings = my.strings[! is.null(my.strings)]
        docxfile = paste0(report.loc, paste(my.strings, collapse=".") )
    } else {
        docxfile = out.file
    }

    knitr::opts_chunk$set(comment=NA, fig.cap="", fig.keep='all', fig.show='asis', fig.width=figwidth, fig.height=figheight, dpi=300, eval=myeval, results=myresults, echo=myecho, warning=mywarning, message=mymessage)
    ## run knit and pandoc
    knitr::knit(rmdfile, output=mdfile)
    pandoc.string = paste('pandoc',    " --reference-docx=", docx, " ", mdfile, ' -f markdown -t docx -o ', docxfile, sep="")
    system(pandoc.string)
    print(docxfile)
}

