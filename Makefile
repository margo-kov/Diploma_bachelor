SHELL := bash
DOCNAME=main

all: report

.PHONY = format clean

format:
	(\
		for file in $$(find -name "*.tex"); do \
		./fold.py -w 80 -nc "$$file" > /tmp/foldpy.tmpfile; \
		cat /tmp/foldpy.tmpfile > "$$file" && rm /tmp/foldpy.tmpfile; \
		done \
	)

report:
	pdflatex $(DOCNAME).tex
	bibtex $(DOCNAME).aux
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex
	mv main.pdf Diploma.pdf

view: report clean
	evince Diploma.pdf

clean:
	rm -f *.acn *.aux *.bbl *.blg *.dvi *.fdb_latexmk *.fls *.glo *.ist *.log *.lot *.out *.toc *.lof

