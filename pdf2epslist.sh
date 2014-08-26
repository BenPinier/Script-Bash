#!/usr/bin/bash

# Decompose a pdf file into eps files, the number of output
# files is number of pages from pdf file, the outputs are put
# in a directory name according to the pdf file name
# pdf2epslist <nameofpdffile>

FILE=$1

nbpage=$(pdfinfo $1 | grep Pages | awk '{print $2}')

echo 'number of pages for the pdf file:'$nbpage

namedir=${FILE%%.*}


if [ ! -d $namedir ]
then
	mkdir $namedir
fi

for i in $(seq 1 $nbpage)
do
	pdftops -eps -f $i -l $i $FILE ${namedir}/${namedir}$i.eps
done
