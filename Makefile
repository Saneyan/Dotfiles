$(guile (load "guile.scm"))

DIRNAME			:= $(shell cd $(shell dirname $0) && pwd)
CMDS				:= dmgr dmgr.debug dmgrctl dmgrctl.debug
COREDIR			:= $(HOME)/.dmgr
SRCDIR			:= $(COREDIR)/dmgr/src
RPATH				:= $(COREDIR)/paths/_repo
export PATH := $(HOME)/bin:$(PATH)

define link
	@ln -fsv $(DIRNAME)/core $(COREDIR)
	@echo $(DIRNAME) > $(RPATH)
	for dst in $(CMDS); do \
		ln -fsv $(SRCDIR)/commands/dmgr $(HOME)/bin/$$dst ; \
	done
endef

define unlink
	for dst in $(CMDS); do \
		rm -fv $(HOME)/bin/$$dst ; \
	done
	@rm -fv $(RPATH) $(COREDIR)
endef

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
	while read opt; do \
		[[ "$$opt" =~ "y|n" ]] && break ; \
		echo -n "Type (y or n): " ; \
	done

	$(shell [[ $$opt == "y" ]] && rm -rfv $(HOME)/bin)

migrate:
	dmgrctl disable :all:stash
	$(unlink)
	$(link)
	dmgrctl enable :pop

update-xmonad:

submodules::
	git submodule init
	git submodule update
