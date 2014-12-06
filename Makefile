HC	:= ghc
CMDS	:= dmgr dmgr.debug dmgrctl dmgrctl.debug
DIRNAME	:= $(shell cd $(shell dirname $0) && pwd)
XMDIR	:= $(HOME)/.xmonad
XMBIN	:= $(XMDIR)/xmonad-$(shell uname -m)-linux
COREDIR	:= $(HOME)/.dmgr
SRCDIR	:= $(COREDIR)/dmgr/src
RPATH	:= $(COREDIR)/paths/_repo
export PATH := $(HOME)/bin:$(PATH)

define xmfiles
	(define (xmfiles)
		'("xmonad.hs"
			"Aliases.hs"
			"Bindings.hs"
			"Email.hs"
			"Help.hs"
			"Hooks.hs"
			"Workspace.hs"))
endef

define link
	@ln -fsv $(DIRNAME)/core $(COREDIR)
	echo $(DIRNAME) > $(RPATH)
	@for dst in $(CMDS); do \
		ln -fsv $(SRCDIR)/commands/dmgr $(HOME)/bin/$$dst ; \
	done
endef

define unlink
	@for dst in $(CMDS); do \
		rm -fv $(HOME)/bin/$$dst ; \
	done
	@rm -fv $(RPATH) $(COREDIR)
endef

$(guile (load "guile.scm"))
$(guile $(xmfiles))

all: install

install: submodules
	-@mkdir $(HOME)/bin
	$(link)
	@touch $(COREDIR)/conf/{plugin,inuse}.list
	@echo "Created $$(echo $(COREDIR)/conf/{plugin,inuse}.list)"
	dmgrctl enable system

clean:
	dmgrctl disable :all
	rm -fv $(COREDIR)/conf/{plugin,inuse}.list
	$(unlink)

	@echo -n "Do you want to delete $(HOME)/bin? (y/n): "
	@while read opt; do \
		[[ "$$opt" =~ "y|n" ]] && break ; \
		echo -n "Type (y or n): " ; \
	done

	$(shell [[ $$opt == "y" ]] && rm -rfv $(HOME)/bin)

migrate:
	dmgrctl disable :all:stash
	$(unlink)
	$(link)
	dmgrctl enable :pop

xmonad: $(guile (xmfpath xmfiles))
	@if [ ! -e $(XMDIR)/xmonad.hs ]; then \
		echo "No main file found. Aborted." ; \
		exit 1 ; \
	fi

	@if [ ! -e $(XMDIR)/Gfxt/Email.hs ]; then \
		if [ -e $(XMDIR)/Gfxt/Email.sample.hs ]; then \
			echo "No private configuration module found. Copying the sample code." ; \
			cp $(XMDIR)/Gfxt/Email.sample.hs $(XMDIR)/Gfxt/Email.hs ; \
		else ; \
			echo "The private configuration module and sample code is not found. Creating empty module." ; \
			touch $(XMDIR)/Gfxt/Email.hs ; \
		fi ; \
	fi

	@echo -n "Is your keyboard layout UNIX? (y/n): "
	@while read opt; do \
		[[ $$opt =~ "y|n" ]] && break ; \
		echo "Type (y or n): " ; \
	done

	[ "${opt}" = "y" ] && opts=($opts "-DUNIX_US_LAYOUT=true")

$(XMBIN): %.hs
	$(HC) --make $@ -o $(XMBIN)

submodules::
	git submodule init
	git submodule update
