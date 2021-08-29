PDF := $(patsubst src/%.md,pdf/%.pdf,$(wildcard src/*.md))
HTML := $(patsubst src/%.md,docs/lectures/%.html,$(wildcard src/*.md))
THEME := theme.css

all : $(PDF) $(HTML)

$(THEME):
	wget -O $@ https://raw.githubusercontent.com/nandanrao/bgse-marp-theme/master/bgse.css

pdf/%.pdf: src/%.md $(THEME)
	marp --theme theme.css $< --pdf --allow-local-files -o $@

docs/lectures/%.html: src/%.md $(THEME)
	marp --theme theme.css $< --html --allow-local-files -o $@

clobber :
	rm -f $(PDF)
	rm -f $(HTML)
	rm -f $(THEME)
