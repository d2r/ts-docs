# Makefile for Sphinx documentation

.PHONY: help dirhtml singlehtml

BUILDDIR=.
srcdir=.
SPHINXBUILD=sphinx-build
PAPER         = letter
BUILDDIR      = docbuild

SBUILD = $(SPHINXBUILD) ${PAPEROPT_letter}

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  dirhtml    to make HTML files named index.html in directories"
	@echo "  singlehtml to make a single large HTML file"

html: poc/cache_sm.dot
	$(SBUILD) -d $(BUILDDIR)/doctrees -b html $(srcdir) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/html."

dirhtml:
	$(SBUILD) -d $(BUILDDIR)/doctrees -b dirhtml $(srcdir) $(BUILDDIR)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR)/dirhtml."

singlehtml:
	$(SBUILD) -d $(BUILDDIR)/doctrees -b singlehtml $(srcdir) $(BUILDDIR)/singlehtml
	@echo
	@echo "Build finished. The HTML page is in $(BUILDDIR)/singlehtml."

clean:
	-rm -rf html warn.log
	-rm -rf $(BUILDDIR)/doctrees $(BUILDDIR)/html $(BUILDDIR)/dirhtml $(BUILDDIR)/singlehtml 

publish:
	$(SHELL) ./publish.sh

poc/cache_sm.dot: poc/cache.sm
	java -jar ~/opt/smc_6_6_3/bin/Smc.jar -graph -glevel 1 ~/git/ts-docs/poc/cache.sm
