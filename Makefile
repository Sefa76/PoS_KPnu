TEXFILE = skeleton
PDFLATEX = pdflatex
BIB = bibtex

# derived
TEXSRC = $(TEXFILE).tex
PDF = $(TEXFILE).pdf

# Default target
all: pdf

# Rule to generate the PDF
pdf: $(TEXSRC)
	$(PDFLATEX) $(TEXSRC)
	$(BIB) $(TEXFILE)
	$(PDFLATEX) $(TEXSRC)
	$(PDFLATEX) $(TEXSRC)

# Clean up auxiliary files
clean:
	rm -f $(TEXFILE).aux $(TEXFILE).bbl $(TEXFILE).bcf $(TEXFILE).blg \
	      $(TEXFILE).log $(TEXFILE).out $(TEXFILE).run.xml $(TEXFILE).toc

# Clean everything, including the PDF
cleanall: clean
	rm -f $(PDF)


.PHONY: all clean cleanall
