#!/bin/bash


for I in ./*.pdf; do
	FILENAME=$(basename $I .pdf);
	echo "Processing $FILENAME"
	convert -density 150 ${FILENAME}.pdf -quality 90 ${FILENAME}.png
	echo "Removing old $FILENAME"
	sleep 3 && rm ${FILENAME}.pdf
	echo "Combining $FILENAME images to pdf"
	convert ${FILENAME}-*.png ${FILENAME}.pdf
done

rm -f *.png
