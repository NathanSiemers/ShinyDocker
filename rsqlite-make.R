
try( remove.packages( c('RSQLite', 'sqldf') ) )
##try( system('rm -rf RSQLite*') )

install.packages('sqldf') #you must do this first.

if ( ! library('sqldf', character.only=TRUE, logical.return=TRUE) ) {
    quit(status=1, save='no' )
}
##download.packages('RSQLite', '.')
##system('tar xvzf RSQLite*.tar.gz')

system('
cd RSQLite/src/vendor/sqlite3 && cat sqlite3.c | sed -e "s/define SQLITE_MAX_COLUMN 2000/define SQLITE_MAX_COLUMN 32767/" > sqlite.tmp &&  mv sqlite.tmp sqlite3.c
')

install.packages('RSQLite', repos = NULL, type="source")

if ( ! library('RSQLite', character.only=TRUE, logical.return=TRUE) ) {
    quit(status=1, save='no')
}

## the above won't really test if rsqlite was installed as it was installed after the try :(

