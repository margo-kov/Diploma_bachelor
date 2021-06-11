SHELL := bash

.PHONY = format 
format:
	(\
		for file in $$(find -name "*.tex"); do \
		./fold.py -w 80 -nc "$$file" > /tmp/foldpy.tmpfile; \
		cat /tmp/foldpy.tmpfile > "$$file" && rm /tmp/foldpy.tmpfile; \
		done \
	)

build:
	pdflatex main.tex && rm *.{glo,ist,out,aux,toc,lot,lof,acn,log} && mv main.pdf Diploma.pdf
