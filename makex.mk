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
#     path to the LuaX interpreter (see https://github.com/CDSoft/luax)
# YPP, YPP_LUA, YPP_LUAX, YPP_PANDOC
#     path to the ypp executables (see https://github.com/CDSoft/ypp)
# UPP
#     path to the upp executable (see https://github.com/CDSoft/upp)
# BANG
#     path to the bang executable (see https://github.com/CDSoft/bang)
# PANDA
#     path to the panda script (see https://github.com/CDSoft/panda)
# PANDOC
#     path to the pandoc executable (see https://pandoc.org)
# LATEX_TEMPLATE
#     path to a LaTeX template
#     (see https://github.com/Wandmalfarbe/pandoc-latex-template.git)
# LETTER
#     path to a LaTeX template
#     (see https://github.com/aaronwolen/pandoc-letter.git)
# PANAM_CSS
#     path to a CSS file (see https://benjam.info/panam)
# PANDOC_MD, PANDA_MD
#     shortcut to pandoc/panda with some default parameters
#     to generate Markdown documents
# PANDOC_GFM, PANDA_GFM
#     shortcut to pandoc/panda with some default parameters
#     to generate Github Markdown documents
# PANDOC_HTML, PANDA_HTML
#     shortcut to pandoc/panda with some default parameters
#     to generate HTML documents
# PANDOC_PDF, PANDA_PDF
#     shortcut to pandoc/panda with some default parameters
#     to generate PDF documents
# PANDOC_BEAMER, PANDA_BEAMER
#     shortcut to pandoc/panda with some default parameters
#     to generate beamer slideshows
# PANDOC_LETTER, PANDA_LETTER
#     shortcut to pandoc/panda with some default parameters
#     to generate a letter
# LSVG
#     path to the lsvg executable (see https://github.com/CDSoft/lsvg)
# PLANTUML
#     path to plantuml.jar
# DITAA
#     path to ditaa.jar
# MERMAID
#     path to mmdc (Mermaid)
# PENROSE (alias ROGER)
#     path to roger (Penrose)
# GHCUP, GHC, CABAL, STACK
#     path to the ghcup, ghc, cabal, stack executables
#     (see https://www.haskell.org/ghcup/)
# GHC_CMD, CABAL_CMD, STACK_CMD
#     ghc, cabal and stack commands executed through ghcup
#
# It also adds some targets:
#
# makex-clean
#     remove all makex tools
# makex-install
#     install all makex tools
# makex-install-luax
#     install luax
# makex-install-ypp
#     install ypp
# makex-install-upp
#     install upp
# makex-install-bang
#     install bang
# makex-install-pandoc
#     install pandoc
# makex-install-panda
#     install panda
# makex-install-plantuml
#     install PlantUML
# makex-install-ditaa
#     install ditaa
# makex-install-mermaid
#     install mermaid
# makex-install-penrose
#     install penrose
# makex-install-lsvg
#     install lsvg
# makex-install-ghcup
#     install ghcup
# help
#     runs the `welcome` target (user defined)
#     and lists the targets with their documentation

# The project configuration variables can be defined before including
# makex.mk.
#
# Makex update:
# wget http://cdelord.fr/makex/makex.mk

# MAKEX_INSTALL_PATH defines the path where tools are installed
MAKEX_INSTALL_PATH ?= /var/tmp/makex

# MAKEX_CACHE is the path where makex tools sources are stored and built
MAKEX_CACHE ?= $(MAKEX_INSTALL_PATH)/cache

# MAKEX_HELP_TARGET_MAX_LEN is the maximal size of target names
# used to format the help message
MAKEX_HELP_TARGET_MAX_LEN ?= 20

# LUAX_VERSION is a tag or branch name in the LuaX repository
LUAX_VERSION ?= master

# YPP_VERSION is a tag or branch name in the ypp repository
YPP_VERSION ?= master

# UPP_VERSION is a tag or branch name in the upp repository
UPP_VERSION ?= master

# BANG_VERSION is a tag or branch name in the bang repository
BANG_VERSION ?= master

# PANDOC_VERSION is the version number of pandoc
PANDOC_VERSION ?= 3.1.8

# PANDOC_CLI_VERSION is the version number of pandoc-cli
PANDOC_CLI_VERSION ?= 0.1.1.1

# PANDOC_DYNAMIC_LINK is "no" to download a statically linked executable
# or "yes" to compile a dynamically linked executable with cabal
PANDOC_DYNAMIC_LINK ?= no

# PANDOC_LATEX_TEMPLATE_VERSION is a tag or branch name in the
# pandoc-latex-template repository
PANDOC_LATEX_TEMPLATE_VERSION ?= master

# PANDOC_LETTER_VERSION is a tag or branch name in the
# pandoc-letter repository
PANDOC_LETTER_VERSION ?= master

# PANAM_VERSION is a tag or branch name in the
# pan-am repository
PANAM_VERSION ?= master

# PANDA_VERSION is a tag or branch name in the Panda repository
PANDA_VERSION ?= master

# LSVG_VERSION is a tag or branch name in the lsvg repository
LSVG_VERSION ?= master

# GHCUP_INSTALL_BASE_PREFIX is the base of ghcup
GHCUP_INSTALL_BASE_PREFIX ?= $(MAKEX_INSTALL_PATH)/haskell

# HASKELL_GHC_VERSION is the ghc version to install
HASKELL_GHC_VERSION ?= recommended

# HASKELL_CABAL_VERSION is the cabal version to install
HASKELL_CABAL_VERSION ?= recommended

# RUSTUP_HOME is the rustup installation path
RUSTUP_HOME ?= $(MAKEX_INSTALL_PATH)/rustup

# CARGO_HOME is the cargo installation path
CARGO_HOME ?= $(MAKEX_INSTALL_PATH)/cargo

# TYPST_COMPILATION is "no" to download a precompiled executable
# or "yes" to compile typst with cargo
TYPST_COMPILATION ?= no

# TYPST_VERSION is a tag or branch name in the
# typst repository
TYPST_VERSION ?= 0.7.0

# PLANTUML_VERSION is the PlantUML version to install
PLANTUML_VERSION = 1.2023.10

# DITAA_VERSION is the ditaa version to install
DITAA_VERSION = 0.11.0

#}}}

###########################################################################
# Help
###########################################################################

.PHONY: help welcome

BLACK     := $(shell tput -Txterm setaf 0)
RED       := $(shell tput -Txterm setaf 1)
GREEN     := $(shell tput -Txterm setaf 2)
YELLOW    := $(shell tput -Txterm setaf 3)
BLUE      := $(shell tput -Txterm setaf 4)
PURPLE    := $(shell tput -Txterm setaf 5)
CYAN      := $(shell tput -Txterm setaf 6)
WHITE     := $(shell tput -Txterm setaf 7)
BG_BLACK  := $(shell tput -Txterm setab 0)
BG_RED    := $(shell tput -Txterm setab 1)
BG_GREEN  := $(shell tput -Txterm setab 2)
BG_YELLOW := $(shell tput -Txterm setab 3)
BG_BLUE   := $(shell tput -Txterm setab 4)
BG_PURPLE := $(shell tput -Txterm setab 5)
BG_CYAN   := $(shell tput -Txterm setab 6)
BG_WHITE  := $(shell tput -Txterm setab 7)
NORMAL    := $(shell tput -Txterm sgr0)

CMD_COLOR    := ${YELLOW}
TARGET_COLOR := ${GREEN}
TEXT_COLOR   := ${CYAN}
MAKEX_COLOR  := ${BLACK}${BG_CYAN}

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

# Helper target to read a makex variable
.PHONY: query
query:
	@echo $($(VAR))

.SECONDARY:

###########################################################################
# Cleaning makex directories
###########################################################################

makex-clean:
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)clean$(NORMAL)"
	rm -rf $(MAKEX_INSTALL_PATH) $(MAKEX_CACHE)

###########################################################################
# makex directories
###########################################################################

$(MAKEX_CACHE) $(MAKEX_INSTALL_PATH):
	@mkdir -p $@

###########################################################################
# Host detection
###########################################################################

MAKEX_ARCH := $(shell uname -m)
MAKEX_OS := $(shell uname -s)

###########################################################################
# Haskell (via GHCup)
###########################################################################

GHCUP = $(GHCUP_INSTALL_BASE_PREFIX)/.ghcup/bin/ghcup
GHC = $(dir $(GHCUP))/ghc
CABAL = $(dir $(GHCUP))/cabal
STACK = $(dir $(GHCUP))/stack

export PATH := $(dir $(GHCUP)):$(HOME)/.cabal:$(PATH)

export GHCUP_INSTALL_BASE_PREFIX
export GHCUP_SKIP_UPDATE_CHECK=yes

$(GHCUP) $(GHC) $(CABAL) $(STACK):
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install GHCup (ghc, cabal, stack and hls)$(NORMAL)"
	@test -f $@ \
	|| \
	(   export GHCUP_INSTALL_BASE_PREFIX="$(GHCUP_INSTALL_BASE_PREFIX)"; \
	    export BOOTSTRAP_HASKELL_NONINTERACTIVE=yes; \
	    export BOOTSTRAP_HASKELL_GHC_VERSION=$(HASKELL_GHC_VERSION); \
	    export BOOTSTRAP_HASKELL_CABAL_VERSION=$(HASKELL_CABAL_VERSION); \
	    export BOOTSTRAP_HASKELL_INSTALL_HLS=yes; \
	    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh \
	)

GHC_CMD   = $(GHCUP) run ghc --
CABAL_CMD = $(GHCUP) run cabal --
STACK_CMD = $(GHCUP) run stack -- --stack-root=$(GHCUP_INSTALL_BASE_PREFIX)/.stack

makex-install: makex-install-ghcup
makex-install-ghcup: $(GHCUP)

###########################################################################
# Rust
###########################################################################

RUSTUP = $(CARGO_HOME)/bin/rustup
RUSTC = $(CARGO_HOME)/bin/rustc
CARGO = $(CARGO_HOME)/bin/cargo

export RUSTUP_HOME
export CARGO_HOME

export PATH := $(dir $(CARGO)):$(PATH)

$(RUSTUP) $(RUSTC) $(CARGO):
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Rust (rustup, rustc, cargo)$(NORMAL)"
	@test -f $@ \
	|| \
	(   export CARGO_HOME="$(CARGO_HOME)"; \
	    export RUSTUP_HOME=$(RUSTUP_HOME); \
	    mkdir -p $(RUSTUP_HOME); \
	    curl https://sh.rustup.rs -sSf -o $(RUSTUP_HOME)/rustup-install.sh; \
		chmod +x  $(RUSTUP_HOME)/rustup-install.sh; \
	    $(RUSTUP_HOME)/rustup-install.sh -y -v --no-modify-path; \
	)

makex-install: makex-install-rust
makex-install-rust: $(CARGO)

###########################################################################
# LuaX
###########################################################################

LUAX_URL = https://github.com/CDSoft/luax
LUAX = $(MAKEX_INSTALL_PATH)/luax/$(LUAX_VERSION)/bin/luax

export PATH := $(dir $(LUAX)):$(PATH)

$(dir $(LUAX)):
	@mkdir -p $@

$(LUAX): | $(MAKEX_CACHE) $(dir $(LUAX))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install LuaX$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/luax \
	        && ( cd $(MAKEX_CACHE)/luax && git pull ) \
	        || git clone $(LUAX_URL) $(MAKEX_CACHE)/luax \
	    ) \
	    && cd $(MAKEX_CACHE)/luax \
	    && git checkout $(LUAX_VERSION) \
	    && PREFIX=$(realpath $(dir $@)/..) ninja install \
	)

makex-install: makex-install-luax
makex-install-luax: $(LUAX)

###########################################################################
# YPP
###########################################################################

YPP_URL = https://github.com/CDSoft/ypp
YPP = $(MAKEX_INSTALL_PATH)/ypp/$(YPP_VERSION)/bin/ypp
YPP_LUA = $(MAKEX_INSTALL_PATH)/ypp/$(YPP_VERSION)/bin/ypp-lua
YPP_LUAX = $(MAKEX_INSTALL_PATH)/ypp/$(YPP_VERSION)/bin/ypp-luax
YPP_PANDOC = $(MAKEX_INSTALL_PATH)/ypp/$(YPP_VERSION)/bin/ypp-pandoc

export PATH := $(dir $(YPP)):$(PATH)

$(dir $(YPP)):
	@mkdir -p $@

$(YPP) $(YPP_LUA) $(YPP_LUAX) $(YPP_PANDOC): | $(LUAX) $(MAKEX_CACHE) $(dir $(YPP))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install ypp$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/ypp \
	        && ( cd $(MAKEX_CACHE)/ypp && git pull ) \
	        || git clone $(YPP_URL) $(MAKEX_CACHE)/ypp \
	    ) \
	    && cd $(MAKEX_CACHE)/ypp \
	    && git checkout $(YPP_VERSION) \
	    && PREFIX=$(realpath $(dir $@)/..) ninja install \
	)

makex-install: makex-install-ypp
makex-install-ypp: $(YPP) $(YPP_LUA) $(YPP_LUAX) $(YPP_PANDOC)

###########################################################################
# UPP
###########################################################################

UPP_URL = https://github.com/CDSoft/upp
UPP = $(MAKEX_INSTALL_PATH)/upp/$(UPP_VERSION)/bin/upp

export PATH := $(dir $(UPP)):$(PATH)

$(dir $(UPP)):
	@mkdir -p $@

$(UPP): | $(LUAX) $(MAKEX_CACHE) $(dir $(UPP))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install UPP$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/upp \
	        && ( cd $(MAKEX_CACHE)/upp && git pull ) \
	        || git clone $(UPP_URL) $(MAKEX_CACHE)/upp \
	    ) \
	    && cd $(MAKEX_CACHE)/upp \
	    && git checkout $(UPP_VERSION) \
	    && make install PREFIX=$(realpath $(dir $@)/..) \
	)

makex-install: makex-install-upp
makex-install-upp: $(UPP)

###########################################################################
# Bang
###########################################################################

BANG_URL = https://github.com/CDSoft/bang
BANG = $(MAKEX_INSTALL_PATH)/bang/$(bang_VERSION)/bin/bang

export PATH := $(dir $(BANG)):$(PATH)

$(dir $(BANG)):
	@mkdir -p $@

$(BANG): | $(LUAX) $(MAKEX_CACHE) $(dir $(BANG))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Bang$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/bang \
	        && ( cd $(MAKEX_CACHE)/bang && git pull ) \
	        || git clone $(BANG_URL) $(MAKEX_CACHE)/bang \
	    ) \
	    && cd $(MAKEX_CACHE)/bang \
	    && git checkout $(BANG_VERSION) \
	    && PREFIX=$(realpath $(dir $@)/..) ninja install \
	)

makex-install: makex-install-bang
makex-install-bang: $(BANG)

###########################################################################
# Pandoc LaTeX template
###########################################################################

LATEX_TEMPLATE_URL = https://github.com/Wandmalfarbe/pandoc-latex-template.git
LATEX_TEMPLATE = $(MAKEX_INSTALL_PATH)/pandoc/pandoc-latex-template/eisvogel.tex

$(dir $(LATEX_TEMPLATE)):
	@mkdir -p $@

$(LATEX_TEMPLATE): | $(MAKEX_CACHE) $(dir $(LATEX_TEMPLATE))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Pandoc LaTeX Template$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/pandoc-latex-template \
	        && ( cd $(MAKEX_CACHE)/pandoc-latex-template && git pull ) \
	        || git clone $(LATEX_TEMPLATE_URL) $(MAKEX_CACHE)/pandoc-latex-template \
	    ) \
	    && cd $(MAKEX_CACHE)/pandoc-latex-template \
	    && git checkout $(PANDOC_LATEX_TEMPLATE_VERSION) \
	    && cp $(MAKEX_CACHE)/pandoc-latex-template/eisvogel.tex $@ \
	)

###########################################################################
# Pandoc Letter
###########################################################################

LETTER_URL = https://github.com/aaronwolen/pandoc-letter.git
LETTER = $(MAKEX_INSTALL_PATH)/pandoc/pandoc-letter/template-letter.tex

$(dir $(LETTER)):
	@mkdir -p $@

$(LETTER): | $(MAKEX_CACHE) $(dir $(LETTER))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Pandoc Letter$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/pandoc-letter \
	        && ( cd $(MAKEX_CACHE)/pandoc-letter && git pull ) \
	        || git clone $(LETTER_URL) $(MAKEX_CACHE)/pandoc-letter \
	    ) \
	    && cd $(MAKEX_CACHE)/pandoc-letter \
	    && git checkout $(PANDOC_LETTER_VERSION) \
	    && cp $(MAKEX_CACHE)/pandoc-letter/template-letter.tex $@ \
	)

###########################################################################
# Pandoc Panam CSS
###########################################################################

PANAM_URL = https://github.com/CDSoft/pan-am
PANAM_CSS = $(MAKEX_INSTALL_PATH)/pandoc/panam/styling.css

$(dir $(PANAM_CSS)):
	@mkdir -p $@

$(PANAM_CSS): | $(MAKEX_CACHE) $(dir $(PANAM_CSS))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Pandoc Pan Am CSS$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/pan-am \
	        && ( cd $(MAKEX_CACHE)/pan-am && git pull ) \
	        || git clone $(PANAM_URL) $(MAKEX_CACHE)/pan-am \
	    ) \
	    && cd $(MAKEX_CACHE)/pan-am \
	    && git checkout $(PANAM_VERSION) \
	    && cp $(MAKEX_CACHE)/pan-am/styling.css $@ \
	)

###########################################################################
# Pandoc
###########################################################################

PANDOC = $(MAKEX_INSTALL_PATH)/pandoc/$(PANDOC_VERSION)/pandoc

export PATH := $(dir $(PANDOC)):$(PATH)

$(dir $(PANDOC)) $(MAKEX_CACHE)/pandoc:
	@mkdir -p $@

ifeq ($(PANDOC_DYNAMIC_LINK),no)

PANDOC_URL = https://github.com/jgm/pandoc/releases/download/$(PANDOC_VERSION)/$(PANDOC_ARCHIVE)

ifeq ($(MAKEX_OS)-$(MAKEX_ARCH),Linux-x86_64)
PANDOC_ARCHIVE = pandoc-$(PANDOC_VERSION)-linux-amd64.tar.gz
endif
ifeq ($(MAKEX_OS)-$(MAKEX_ARCH),Linux-aarch64)
PANDOC_ARCHIVE = pandoc-$(PANDOC_VERSION)-linux-arm64.tar.gz
endif

check_pandoc_architecture:
	@test -n "$(PANDOC_ARCHIVE)" \
	|| (echo "$(BG_RED)ERROR$(NORMAL)$(RED): $(MAKEX_OS)-$(MAKEX_ARCH): Unknown archivecture, can not install pandoc$(NORMAL)"; false)

$(PANDOC): check_pandoc_architecture | $(MAKEX_CACHE) $(MAKEX_CACHE)/pandoc $(dir $(PANDOC)) $(LATEX_TEMPLATE) $(LETTER) $(PANAM_CSS)
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Pandoc$(NORMAL)"
	@test -f $(@) \
	|| \
	( wget -c $(PANDOC_URL) -O $(MAKEX_CACHE)/pandoc/$(notdir $(PANDOC_URL)) \
	    && tar -C $(MAKEX_CACHE)/pandoc -xzf $(MAKEX_CACHE)/pandoc/$(notdir $(PANDOC_URL)) \
	    && cp -P $(MAKEX_CACHE)/pandoc/pandoc-$(PANDOC_VERSION)/bin/* $(dir $@) \
	)

else

$(PANDOC): | $(MAKEX_CACHE) $(MAKEX_CACHE)/pandoc $(dir $(PANDOC)) $(LATEX_TEMPLATE) $(LETTER) $(PANAM_CSS) $(CABAL)
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Pandoc$(NORMAL)"
	@test -f $(@) \
	|| \
	$(CABAL) install pandoc-$(PANDOC_VERSION) pandoc-cli-$(PANDOC_CLI_VERSION) --install-method=copy --installdir=$(dir $@)

endif

makex-install: makex-install-pandoc
makex-install-pandoc: $(PANDOC)

###########################################################################
# Panda
###########################################################################

PANDA_URL = https://github.com/CDSoft/panda
PANDA = $(MAKEX_INSTALL_PATH)/pandoc/$(PANDOC_VERSION)/panda/$(PANDA_VERSION)/bin/panda

export PATH := $(dir $(PANDA)):$(PATH)

export PANDA_CACHE ?= $(MAKEX_CACHE)/.panda

$(dir $(PANDA)) $(PANDA_CACHE):
	@mkdir -p $@

$(PANDA): | $(LUAX) $(PANDOC) $(MAKEX_CACHE) $(dir $(PANDA)) $(PANDA_CACHE) $(PLANTUML) $(DITAA)
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Panda$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/panda \
	        && ( cd $(MAKEX_CACHE)/panda && git pull ) \
	        || git clone $(PANDA_URL) $(MAKEX_CACHE)/panda \
	    ) \
	    && cd $(MAKEX_CACHE)/panda \
	    && git checkout $(PANDA_VERSION) \
	    && PREFIX=$(realpath $(dir $@)/..) ninja install \
	    && sed -i 's#^pandoc #$(PANDOC) #' $@ \
	)

makex-install: makex-install-panda
makex-install-panda: $(PANDA)

###########################################################################
# Typst
###########################################################################

TYPST = $(MAKEX_INSTALL_PATH)/typst/$(TYPST_VERSION)/bin/typst

export PATH := $(dir $(TYPST)):$(PATH)

$(dir $(TYPST)) $(MAKEX_CACHE)/typst/$(TYPST_VERSION):
	@mkdir -p $@

ifeq ($(TYPST_COMPILATION),no)

TYPST_URL = https://github.com/typst/typst/releases/download/v$(TYPST_VERSION)/$(TYPST_ARCHIVE)

ifeq ($(MAKEX_OS)-$(MAKEX_ARCH),Linux-x86_64)
TYPST_ARCHIVE = typst-x86_64-unknown-linux-musl.tar.xz
endif
ifeq ($(MAKEX_OS)-$(MAKEX_ARCH),Linux-aarch64)
TYPST_ARCHIVE = typst-aarch64-unknown-linux-musl.tar.xz
endif

check_typst_architecture:
	@test -n "$(TYPST_ARCHIVE)" \
	|| (echo "$(BG_RED)ERROR$(NORMAL)$(RED): $(MAKEX_OS)-$(MAKEX_ARCH): Unknown archivecture, can not install typst$(NORMAL)"; false)

$(TYPST): check_typst_architecture | $(MAKEX_CACHE) $(MAKEX_CACHE)/typst/$(TYPST_VERSION) $(dir $(TYPST))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Typst$(NORMAL)"
	@test -f $(@) \
	|| \
	( wget -c $(TYPST_URL) -O $(MAKEX_CACHE)/typst/$(TYPST_VERSION)/$(notdir $(TYPST_URL)) \
	    && tar -C $(MAKEX_CACHE)/typst/$(TYPST_VERSION) --strip-components 1 -xJf $(MAKEX_CACHE)/typst/$(TYPST_VERSION)/$(notdir $(TYPST_URL)) \
	    && cp -P $(MAKEX_CACHE)/typst/$(TYPST_VERSION)/typst $(dir $@) \
	)

else

$(TYPST): | $(MAKEX_CACHE) $(dir $(TYPST)) $(CARGO)
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install Typst$(NORMAL)"
	@test -f $(@) \
	|| \
	$(CARGO) install --git https://github.com/typst/typst --tag v$(TYPST_VERSION) --root $(realpath $(dir $@)/..)

endif

makex-install: makex-install-typst
makex-install-typst: $(TYPST)

###########################################################################
# lsvg
###########################################################################

LSVG_URL = https://github.com/CDSoft/lsvg
LSVG = $(MAKEX_INSTALL_PATH)/lsvg/$(LSVG_VERSION)/bin/lsvg

export PATH := $(dir $(LSVG)):$(PATH)

$(dir $(LSVG)):
	@mkdir -p $@

$(LSVG): | $(LUAX) $(MAKEX_CACHE) $(dir $(LSVG))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install lsvg$(NORMAL)"
	@test -f $(@) \
	|| \
	(   (   test -d $(MAKEX_CACHE)/lsvg \
	        && ( cd $(MAKEX_CACHE)/lsvg && git pull ) \
	        || git clone $(LSVG_URL) $(MAKEX_CACHE)/lsvg \
	    ) \
	    && cd $(MAKEX_CACHE)/lsvg \
	    && git checkout $(LSVG_VERSION) \
	    && PREFIX=$(realpath $(dir $@)/..) ninja install \
	)

makex-install: makex-install-lsvg
makex-install-lsvg: $(LSVG)

###########################################################################
# PlantUML
###########################################################################

PLANTUML_URL = https://github.com/plantuml/plantuml/releases/download/v$(PLANTUML_VERSION)/plantuml-$(PLANTUML_VERSION).jar
PLANTUML = $(MAKEX_INSTALL_PATH)/plantuml/$(notdir $(PLANTUML_URL))

$(dir $(PLANTUML)):
	@mkdir -p $@

$(PLANTUML): | $(dir $(PLANTUML))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install PlantUML$(NORMAL)"
	@test -f $@ || wget $(PLANTUML_URL) -O $@

makex-install: makex-install-plantuml
makex-install-plantuml: $(PLANTUML)

###########################################################################
# ditaa
###########################################################################

DITAA_URL = https://github.com/stathissideris/ditaa/releases/download/v$(DITAA_VERSION)/ditaa-$(DITAA_VERSION)-standalone.jar
DITAA = $(MAKEX_INSTALL_PATH)/ditaa/$(notdir $(DITAA_URL))

$(dir $(DITAA)):
	@mkdir -p $@

$(DITAA): | $(dir $(DITAA))
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install ditaa$(NORMAL)"
	@test -f $@ || wget $(DITAA_URL) -O $@

makex-install: makex-install-ditaa
makex-install-ditaa: $(DITAA)

###########################################################################
# Mermaid
###########################################################################

MERMAID_MODULE = @mermaid-js/mermaid-cli
MERMAID_INSTALL_PATH = $(MAKEX_INSTALL_PATH)/mermaid
MERMAID = $(MERMAID_INSTALL_PATH)/node_modules/.bin/mmdc

export PATH := $(dir $(MERMAID)):$(PATH)

$(MERMAID): |
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install mermaid$(NORMAL)"
	@test -f $(@) \
	|| \
	(   mkdir -p $(MERMAID_INSTALL_PATH) \
	    && cd $(MERMAID_INSTALL_PATH) \
	    && npm install $(MERMAID_MODULE) \
	)

makex-install: makex-install-mermaid
makex-install-mermaid: $(MERMAID)

###########################################################################
# Penrose
###########################################################################

PENROSE_MODULE = @penrose/roger
PENROSE_INSTALL_PATH = $(MAKEX_INSTALL_PATH)/penrose
PENROSE = $(PENROSE_INSTALL_PATH)/node_modules/.bin/roger
ROGER = $(PENROSE)

export PATH := $(dir $(PENROSE)):$(PATH)

$(PENROSE): |
	@echo "$(MAKEX_COLOR)[MAKEX]$(NORMAL) $(TEXT_COLOR)install penrose$(NORMAL)"
	@test -f $(@) \
	|| \
	(   mkdir -p $(PENROSE_INSTALL_PATH) \
	    && cd $(PENROSE_INSTALL_PATH) \
	    && npm install $(PENROSE_MODULE) \
	)

makex-install: makex-install-penrose
makex-install-penrose: $(PENROSE)

###########################################################################
# Panda shortcuts
###########################################################################

PANDOC_MD = $(PANDOC)
PANDOC_MD += --to markdown

PANDA_MD = $(PANDA)
PANDA_MD += --to markdown

PANDOC_GFM = $(PANDOC)
PANDOC_GFM += --to gfm

PANDA_GFM = $(PANDA)
PANDA_GFM += --to gfm

PANDOC_HTML = $(PANDOC)
PANDOC_HTML += --to html5
PANDOC_HTML += --css $(PANAM_CSS)
PANDOC_HTML += --embed-resources --standalone

PANDA_HTML = $(PANDA)
PANDA_HTML += --to html5
PANDA_HTML += --css $(PANAM_CSS)
PANDA_HTML += --embed-resources --standalone

PANDOC_PDF = $(PANDOC)
PANDOC_PDF += --to latex
PANDOC_PDF += --template=$(LATEX_TEMPLATE)

PANDA_PDF = $(PANDA)
PANDA_PDF += --to latex
PANDA_PDF += --template=$(LATEX_TEMPLATE)

PANDOC_BEAMER = $(PANDOC)
PANDOC_BEAMER += --to beamer
PANDOC_BEAMER += -V theme:Madrid -V colortheme:default

PANDA_BEAMER = $(PANDA)
PANDA_BEAMER += --to beamer
PANDA_BEAMER += -V theme:Madrid -V colortheme:default

PANDOC_LETTER = $(PANDOC)
PANDOC_LETTER += --to latex
PANDOC_LETTER += --template=$(LETTER)
PANDOC_LETTER += -V documentclass:letter
PANDOC_LETTER += -V lang:en

PANDA_LETTER = $(PANDA)
PANDA_LETTER += --to latex
PANDA_LETTER += --template=$(LETTER)
PANDA_LETTER += -V documentclass:letter
PANDA_LETTER += -V lang:en
