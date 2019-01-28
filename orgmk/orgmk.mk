EMACS_BATCH_CONFIG='/home/nick/.emacs.d/orgmk/org-config.el'
EMACS=emacs --batch --no-init-file --load $(EMACS_BATCH_CONFIG)



# INIT=.emacs.el

# $(INIT): $(filename).org
# $(EMACS) --find-file $(filename).org --funcall org-babel-tangle --kill

$(filename).tex: $(filename).org
	echo "$(filename).org has changed. Updating"
	$(EMACS) --find-file $(filename).org --funcall org-latex-export-to-latex --kill


$(filename).pdf: $(filename).tex
	tex2pdf $(filename).tex




# TC3F.txt: $(INIT)
# emacs --batch --no-init-file --load .org-mode.emacs.el --find-file $(SRC) --funcall org-ascii-export-to-ascii --kill

# TC3F.html: $(INIT)
# emacs --batch --no-init-file --load .org-mode.emacs.el --find-file $(SRC) --funcall org-html-export-to-html --kill

# TC3F.pdf: $(INIT)
# emacs --batch --no-init-file --load .org-mode.emacs.el --find-file $(SRC) --funcall org-latex-export-to-pdf --kill

# all: TC3F.txt TC3F.html TC3F.pdf

# clean:
# rm $(INIT)
# rm TC3F.txt
# rm TC3F.html
# rm TC3F.pdf
