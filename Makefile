CMDS	= dmgr dmgr.debug dmgrctl dmgrctl.debug
DIRNAME := $(shell cd $(dirname $0) && pwd)
COREDIR := $(HOME)/.dmgr
SRCDIR	:= $(COREDIR)/dmgr/src
RPATH := $(COREDIR)/paths/_repo
export PATH := $(HOME)/bin:$(PATH)

define link
	@ln -fsv $(DIRNAME)/core $(COREDIR)
	echo $(DIRNAME) > $(RPATH)
	@for dst in $(CMDS); do \
		ln -fsv $(SRCDIR)/commands/dmgr $(HOME)/bin/$$dst; \
	done
endef

define unlink
	@for dst in $(CMDS); do \
		rm -fv $(HOME)/bin/$$dst; \
	done
	@rm -fv $(RPATH) $(COREDIR)
endef

$(guile (load "guile.scm"))

.PHONY: all
all: submodules install

.PHONY: install
install:
	-@mkdir $(HOME)/bin
	$(link)
	@touch $(COREDIR)/conf/{plugin,inuse}.list
	@echo "Created $$(echo $(COREDIR)/conf/{plugin,inuse}.list)"
	dmgrctl enable system

.PHONY: clean
clean:
	dmgrctl disable :all
	rm -fv $(COREDIR)/conf/{plugin,inuse}.list
	$(unlink)

	@echo -n "Do you want to delete $(HOME)/bin? (y/n): "
	@while read opt; do \
		[[ "$$opt" =~ "y|n" ]] && break; \
		echo -n "Type (y or n): "; \
	done

	$(shell [[ $$opt == "y" ]] && rm -rfv $(HOME)/bin)

.PHONY: migrate
migrate:
	dmgrctl disable :all :stash
	$(unlink)
	$(link)
	dmgrctl enable :pop

.PHONY: submodules
submodules::
	git submodule init
	git submodule update

#
# XMonad
#
HC	= ghc
XMDIR := $(HOME)/.xmonad
XMBIN := $(XMDIR)/xmonad-$(shell uname -m)-linux
XMOPTS =

ifdef UNIX_US_LAYOUT
	XMOPTS += -DUNIX_US_LAYOUT=true
endif

define xmfiles
	(define xmfiles
		'("xmonad.hs"
		"Aliases.hs"
		"Bindings.hs"
		"Email.hs"
		"Help.hs"
		"Hooks.hs"
		"Workspace.hs"))
	#f
endef

$(guile $(xmfiles))

.PHONY: xmonad
xmonad: xmonad.check xmonad.email-mod $(XMBIN)

.PHONY: xmonad.check
xmonad.check:
	@if [ ! -e $(XMDIR)/xmonad.hs ]; then \
		echo "No main file found. Aborted."; \
		exit 1 ; \
	fi

.PHONY: xmonad.email-mod
xmonad.email-mod:
	@if [ ! -e $(XMDIR)/Gfxt/Email.hs ]; then \
		if [ -e $(XMDIR)/Gfxt/Email.sample.hs ]; then \
			echo "No private configuration module found. Copying the sample code."; \
			cp $(XMDIR)/Gfxt/Email.sample.hs $(XMDIR)/Gfxt/Email.hs; \
		else \
			echo "The private configuration module and sample code is not found. Creating empty module."; \
			touch $(XMDIR)/Gfxt/Email.hs; \
		fi; \
	fi

.PHONY: $(XMBIN)
$(XMBIN): $(guile (xmfpath xmfiles))
	$(HC) --make $^ -o $@ $(XMOPTS)

#
# Help
#
define HELP
* A Makefile of Dotfiles *

Usage:

 make <target> (<options>)

Targets:

 all : Initialize and update git submodules, and build your environment.
 install : Build your environment.
 clear : Clear your environment.
 migrate : Migrate your environment.
 xmonad	: Compile Haskell source files for XMonad.
	UNIX_US_LAYOUT=false	: Support UNIX US keyboard layout.
endef

export HELP

.PHONY: help
help:
	@echo "$$HELP"
