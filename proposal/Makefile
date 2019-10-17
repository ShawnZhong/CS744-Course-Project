all: proposal

proposal:
	pdflatex proposal && bibtex proposal && pdflatex proposal && pdflatex proposal

clean:
	rm -f *.aux
	rm -f *.bbl
	rm -f *.log
	rm -f *.blg
	rm proposal.pdf

