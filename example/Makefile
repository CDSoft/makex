# This file is part of makex.
#
# makex is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# makex is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with makex.  If not, see <https://www.gnu.org/licenses/>.
#
# For further information about makex you can visit
# http://cdelord.fr/makex

# This Makefile is just a test for makex.
# It is also used to generate README.md from makex.md.

# 8<---

BUILD = .build
DEPENDENCIES = $(BUILD)/deps

HTML_OPTS += --table-of-content
HTML_OPTS += --mathml

PDF_OPTS += --table-of-content
PDF_OPTS += --highlight-style tango

## Generates README.md and examples
all: ../README.md
all: $(BUILD)/makex.html
all: $(BUILD)/makex.pdf
all: $(BUILD)/letter.pdf

# first include makex.mk to add makex targets ($(LUAX), $(UPP), ...)
include ../makex.mk
UPP_COLOR = ${BLACK}${BG_GREEN}
PANDA_COLOR = ${BLACK}${BG_GREEN}

# Note that comments starting with `##` are used by the `help` target
# to document targets (try `make help`)

## Clean the build directory
clean:
	rm -rf $(BUILD)

## Clean the build directory and all makex tools
mrproper: clean makex-clean

.SECONDARY:

# This is the welcome message used by the `help` target.
# Note the single `#`, this is not a documentation for `help`.
welcome:
	@echo '${TEXT_COLOR}makex${NORMAL} usage example'

# Preprocess a Markdown file with $(UPP).
# The preprocessed file is also a Markdown file
# that can be used by $(PANDA).
$(BUILD)/%.md: %.md makex.lua | $(UPP) $(DEPENDENCIES)
	@echo '${UPP_COLOR}[UPP]${NORMAL} ${TARGET_COLOR}$< -> $@${NORMAL}'
	@mkdir -p $(dir $@)
	@$(UPP) -MT $@ -MF $(DEPENDENCIES)/$(notdir $@).upp.d \
		-p . -l makex.lua $< -o $@

# Render an HTML file using $(PANDA) (i.e. pandoc and some Lua filters)
$(BUILD)/%.html: $(BUILD)/%.md | $(PANDA) $(PANAM_CSS) img $(DEPENDENCIES)
	@echo '${PANDA_COLOR}[PANDA]${NORMAL} ${TARGET_COLOR}$< -> $@${NORMAL}'
	@PANDA_TARGET=$@ \
	PANDA_DEP_FILE=$(DEPENDENCIES)/$(notdir $@).panda.d \
	$(PANDA_HTML) $(HTML_OPTS) $< -o $@

# Render a PDF file using $(PANDA) (i.e. pandoc and some Lua filters)
$(BUILD)/%.pdf: $(BUILD)/%.md | $(PANDA) $(LATEX_TEMPLATE) img $(DEPENDENCIES)
	@echo '${PANDA_COLOR}[PANDA]${NORMAL} ${TARGET_COLOR}$< -> $@${NORMAL}'
	@PANDA_TARGET=$@ \
	PANDA_DEP_FILE=$(DEPENDENCIES)/$(notdir $@).panda.d \
	$(PANDA_PDF) $(PDF_OPTS) $< -o $@

# Render an english letter using $(PANDA) (i.e. pandoc and some Lua filters)
$(BUILD)/letter.pdf: $(BUILD)/letter.md | $(PANDA) $(LETTER) img $(DEPENDENCIES)
	@echo '${PANDA_COLOR}[PANDA]${NORMAL} ${TARGET_COLOR}$< -> $@${NORMAL}'
	@PANDA_TARGET=$@ \
	PANDA_DEP_FILE=$(DEPENDENCIES)/$(notdir $@).panda.d \
	LANG=en \
	$(LETTER) $< -o $@

$(BUILD)/letter.md: $(MAKEX_CACHE)/pandoc-letter/example/letter.md | $(PANDA)
	@echo '${PANDA_COLOR}[CP]${NORMAL} ${TARGET_COLOR}$< -> $@${NORMAL}'
	@cp $< $@
	@sed -i 's#example/#$(dir $<)#' $@

$(MAKEX_CACHE)/pandoc-letter/example/letter.md: $(LETTER)

# Render a Github Markdown file using $(PANDA)
../README.md: $(BUILD)/makex.md fix_links.lua | $(PANDA) img $(DEPENDENCIES)
	@echo '${PANDA_COLOR}[PANDA]${NORMAL} ${TARGET_COLOR}$< -> $@${NORMAL}'
	@PANDA_TARGET=$@ \
	PANDA_DEP_FILE=$(DEPENDENCIES)/$(notdir $@).panda.d \
	$(PANDA_GFM) -L fix_links.lua $< -o $@

img $(DEPENDENCIES):
	@mkdir -p $@

-include $(wildcard $(DEPENDENCIES)/*.d)
