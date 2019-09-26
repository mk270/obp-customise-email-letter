
DEFAULT := colleague-details
TEMPLATE := template.mustache
TMP := /tmp/tmpfile

all: $(DEFAULT).md $(DEFAULT).pdf $(DEFAULT).ps

%.md: %.json
	mustache $< $(TEMPLATE) > $(TMP)
	mv -f -- $(TMP) $@

%.pdf: %.md
	md2pdf $<

%.ps: %.pdf
	pdftops $<

.PHONY: clean

clean:
	rm -f -- $(DEFAULT).md
	rm -f -- $(DEFAULT).pdf
	rm -f -- $(DEFAULT).ps

