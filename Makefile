SHELL := bash

.PHONY = format 
format:
	(\
		for file in $$(find -name "*.tex"); do \
		./fold.py -w 80 -nc "$$file" > /tmp/foldpy.tmpfile; \
		cat /tmp/foldpy.tmpfile > "$$file" && rm /tmp/foldpy.tmpfile; \
		done \
	)
