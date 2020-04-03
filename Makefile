
O = app/src/main/res

TARGETS = $O/drawable/launcher.png $O/drawable-hdpi/launcher.png $O/drawable-xhdpi/launcher.png

all: $(TARGETS)

$O/drawable/launcher.png: launcher.svg
	mkdir -p $(dir $@)
	convert -background Transparent $< -resize 62x62 -bordercolor Transparent -border 4x6 \( +clone -background Transparent -shadow 60x1+0+2 \) +swap -layers merge +repage $@
	convert -extract 72x72+0+0 +repage $@ $@

$O/drawable-hdpi/launcher.png: launcher.svg
	mkdir -p $(dir $@)
	convert -background Transparent $< -resize 93x93 -bordercolor Transparent -border 6x9 \( +clone -background Transparent -shadow 80x1+0+2 \) +swap -layers merge +repage $@
	convert -extract 108x108+0+0 +repage $@ $@

$O/drawable-xhdpi/launcher.png: launcher.svg
	mkdir -p $(dir $@)
	convert -background Transparent $< -resize 126x126 -bordercolor Transparent -border 8x12 \( +clone -background Transparent -shadow 80x2+0+4 \) +swap -layers merge +repage $@
	convert -extract 144x144+0+0 $@ $@

.PHONY: clean
clean:
	rm -rf $(TARGETS)
