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

###########################################################################
# Configuration
###########################################################################

#{{{
# makex defines some make variable that can be used to execute makex tools:
#
# LUAX
#     path to the LuaX interpretor (see https://github.com/CDSoft/luax)
# UPP
#     path to the upp executable (see https://github.com/CDSoft/upp)
# PANDA
#     path to the panda script (see https://github.com/CDSoft/panda)
# PANDOC
#     path to the pandoc executable (see https://pandoc.org)
# PANDOC_LATEX_TEMPLATE
#     path to a LaTeX template
#     (see https://github.com/Wandmalfarbe/pandoc-latex-template.git)
# PANAM_CSS
#     path to a CSS file (see https://benjam.info/panam)
# PANDA_MD
#     shortcut to panda with some default parameters
#     to generate Markdown documents
# PANDA_GFM
#     shortcut to panda with some default parameters
#     to generate Github Markdown documents
# PANDA_HTML
#     shortcut to panda with some default parameters
#     to generate HTML documents
# PANDA_PDF
#     shortcut to panda with some default parameters
#     to generate PDF documents
# BEAMER
#     shortcut to panda with some default parameters
#     to generate beamer slideshows
#
# It also adds some targets:
#
# makex_clean
#     remove all makex tools
# help
#     runs the `welcome` target (user defined)
#     and lists the targets with their documentation

# The project configuration vatriables can be defined before including
# makex.mk.

# MAKEX_INSTALL_PATH defines the path where tools are installed
MAKEX_INSTALL_PATH ?= /var/tmp/makex

# MAKEX_CACHE is the path where makex tools sources are stored and built
MAKEX_CACHE ?= /var/tmp/makex/cache

# MAKEX_HELP_TARGET_MAX_LEN is the maximal size of target names
# used to format the help message
MAKEX_HELP_TARGET_MAX_LEN ?= 20

# LUAX_VERSION is a tag or branch name in the LuaX repository
LUAX_VERSION ?= master

# UPP_VERSION is a tag or branch name in the upp repository
UPP_VERSION ?= master

# PANDOC_VERSION is the version number of pandoc
PANDOC_VERSION ?= 2.19.2

# PANDOC_LATEX_TEMPLATE_VERSION is a tag or branch name in the
# pandoc-latex-template repository
PANDOC_LATEX_TEMPLATE_VERSION = master

# PANDA_VERSION is a tag or branch name in the Panda repository
PANDA_VERSION ?= master

#}}}

###########################################################################
# Help
###########################################################################

.PHONY: help welcome

RED    := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE   := $(shell tput -Txterm setaf 4)
CYAN   := $(shell tput -Txterm setaf 6)
NORMAL := $(shell tput -Txterm sgr0)

CMD_COLOR    := ${YELLOW}
TARGET_COLOR := ${GREEN}
TEXT_COLOR   := ${YELLOW}

## show this help massage
help: welcome
	@echo ''
	@echo 'Usage:'
	@echo '  ${CMD_COLOR}make${NORMAL} ${TARGET_COLOR}<target>${NORMAL}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${TARGET_COLOR}%-$(MAKEX_HELP_TARGET_MAX_LEN)s${NORMAL} ${TEXT_COLOR}%s${NORMAL}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

###########################################################################
# Cleaning makex direcotries
###########################################################################

makex_clean:
	rm -rf $(MAKEX_INSTALL_PATH) $(MAKEX_CACHE)

###########################################################################
# makex directories
###########################################################################

$(MAKEX_CACHE) $(MAKEX_INSTALL_PATH):
	@mkdir -p $@

###########################################################################
# Host detection
###########################################################################

ARCH := $(shell uname -m)
OS := $(shell uname -s)

###########################################################################
# LuaX
###########################################################################

LUAX_URL = https://github.com/CDSoft/luax
LUAX = $(MAKEX_INSTALL_PATH)/luax/$(LUAX_VERSION)/luax

$(dir $(LUAX)):
	@mkdir -p $@

$(LUAX): | $(MAKEX_CACHE) $(dir $(LUAX))
	@test -f $(@) \
	|| \
	(	(	test -d $(MAKEX_CACHE)/luax \
			&& ( cd $(MAKEX_CACHE)/luax && git pull ) \
			|| git clone $(LUAX_URL) $(MAKEX_CACHE)/luax \
		) \
		&& cd $(MAKEX_CACHE)/luax \
		&& git checkout $(LUAX_VERSION) \
		&& make install-all PREFIX=$(realpath $(dir $@)) \
	)

###########################################################################
# UPP
###########################################################################

UPP_URL = https://github.com/CDSoft/upp
UPP = $(MAKEX_INSTALL_PATH)/upp/$(UPP_VERSION)/upp

$(dir $(UPP)):
	@mkdir -p $@

$(UPP): | $(LUAX) $(MAKEX_CACHE) $(dir $(UPP))
	@test -f $(@) \
	|| \
	(	(	test -d $(MAKEX_CACHE)/upp \
			&& ( cd $(MAKEX_CACHE)/upp && git pull ) \
			|| git clone $(UPP_URL) $(MAKEX_CACHE)/upp \
		) \
		&& cd $(MAKEX_CACHE)/upp \
		&& git checkout $(UPP_VERSION) \
		&& make install PREFIX=$(realpath $(dir $@)) \
	)

###########################################################################
# Pandoc
###########################################################################

ifeq ($(OS)-$(ARCH),Linux-x86_64)
PANDOC_ARCHIVE = pandoc-$(PANDOC_VERSION)-linux-amd64.tar.gz
endif

ifeq ($(PANDOC_ARCHIVE),)
$(error $(OS)-$(ARCH): Unknown archivecture, can not install pandoc)
endif

PANDOC_URL = https://github.com/jgm/pandoc/releases/download/$(PANDOC_VERSION)/$(PANDOC_ARCHIVE)
PANDOC = $(MAKEX_INSTALL_PATH)/pandoc/$(PANDOC_VERSION)/pandoc

$(dir $(PANDOC)) $(MAKEX_CACHE)/pandoc:
	@mkdir -p $@

$(PANDOC): | $(MAKEX_CACHE) $(MAKEX_CACHE)/pandoc $(dir $(PANDOC))
	@test -f $(@) \
	|| \
	( 	wget -c $(PANDOC_URL) -O $(MAKEX_CACHE)/pandoc/$(notdir $(PANDOC_URL)) \
		&& tar -C $(MAKEX_CACHE)/pandoc -xzf $(MAKEX_CACHE)/pandoc/$(notdir $(PANDOC_URL)) \
		&& cp -P $(MAKEX_CACHE)/pandoc/pandoc-$(PANDOC_VERSION)/bin/* $(dir $@) \
	)

###########################################################################
# Pandoc LaTeX template
###########################################################################

PANDOC_LATEX_TEMPLATE_URL = https://github.com/Wandmalfarbe/pandoc-latex-template.git
PANDOC_LATEX_TEMPLATE = $(MAKEX_INSTALL_PATH)/pandoc/pandoc-latex-template/eisvogel.tex

$(dir $(PANDOC_LATEX_TEMPLATE)):
	@mkdir -p $@

$(PANDOC_LATEX_TEMPLATE): | $(PANDOC) $(MAKEX_CACHE) $(dir $(PANDOC_LATEX_TEMPLATE))
	@test -f $(@) \
	|| \
	(	(	test -d $(MAKEX_CACHE)/pandoc-latex-template \
			&& ( cd $(MAKEX_CACHE)/pandoc-latex-template && git pull ) \
			|| git clone $(PANDOC_LATEX_TEMPLATE_URL) $(MAKEX_CACHE)/pandoc-latex-template \
		) \
		&& cd $(MAKEX_CACHE)/pandoc-latex-template \
		&& git checkout $(PANDOC_LATEX_TEMPLATE_VERSION) \
		&& cp $(MAKEX_CACHE)/pandoc-latex-template/eisvogel.tex $@ \
	)

###########################################################################
# Pandoc Panam CSS
###########################################################################

PANAM_URL = https://benjam.info/panam/styling.css
PANAM_CSS = $(MAKEX_INSTALL_PATH)/pandoc/panam/styling.css

$(dir $(PANAM_CSS)):
	@mkdir -p $@

$(PANAM_CSS): | $(PANDOC) $(MAKEX_CACHE) $(dir $(PANAM_CSS))
	@test -f $(@) \
	|| \
	wget -c $(PANAM_URL) -O $@

###########################################################################
# Panda
###########################################################################

PANDA_URL = https://github.com/CDSoft/panda
PANDA = $(MAKEX_INSTALL_PATH)/pandoc/$(PANDOC_VERSION)/panda/$(PANDA_VERSION)/panda

$(dir $(PANDA)):
	@mkdir -p $@

$(PANDA): | $(PANDOC) $(MAKEX_CACHE) $(dir $(PANDA))
	@test -f $(@) \
	|| \
	(	(	test -d $(MAKEX_CACHE)/panda \
			&& ( cd $(MAKEX_CACHE)/panda && git pull ) \
			|| git clone $(PANDA_URL) $(MAKEX_CACHE)/panda \
		) \
		&& cd $(MAKEX_CACHE)/panda \
		&& git checkout $(PANDA_VERSION) \
		&& make install-all PREFIX=$(realpath $(dir $@)) \
		&& sed -i 's#^pandoc #$(PANDOC) #' $@ \
	)

###########################################################################
# Panda shortcuts
###########################################################################

PANDA_MD = $(PANDA)
PANDA_MD += --to markdown

PANDA_GFM = $(PANDA)
PANDA_GFM += --to gfm

PANDA_HTML = $(PANDA)
PANDA_HTML += --embed-resources --standalone
PANDA_HTML += --to html5
PANDA_HTML += --css $(PANAM_CSS)

PANDA_PDF = $(PANDA)
PANDA_PDF += --embed-resources --standalone
PANDA_PDF += --to latex
PANDA_PDF += --template=$(PANDOC_LATEX_TEMPLATE)

BEAMER = $(PANDA)
BEAMER += --embed-resources --standalone
BEAMER += --to beamer
BEAMER += -V theme:Madrid -V colortheme:default
BEAMER += --slide-level=1
BEAMER += --highlight-style tango
