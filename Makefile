CHAPTERS=Chapter-*/Chapter-*.tex  Appendix/Appendix.tex
NAME=AlexLindsay-thesis
AUX=$(NAME).aux front.aux Chapter-*/*.aux Appendix/*.aux optional.aux
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).lof $(NAME).lot \
              $(NAME).log $(NAME).toc

$(NAME).pdf : $(NAME).tex $(NAME).bib front.tex $(CHAPTERS) ncsuthesis.cls optional.tex
	pdflatex -shell-escape $(NAME)
	bibtex $(NAME)
	pdflatex -shell-escape $(NAME)
	pdflatex -shell-escape $(NAME)

clean :
	rm $(AUX) $(INTERMEDIATES)
