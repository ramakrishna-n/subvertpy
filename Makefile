PYTHON = python
PYDOCTOR = pydoctor
EPYDOC = epydoc
SETUP = $(PYTHON) setup.py
TRIAL = trial

all: build build-inplace

build::
	$(SETUP) build

build-inplace::
	$(SETUP) build_ext --inplace

install::
	$(SETUP) install

check::
	$(SETUP) build_ext --inplace
	PYTHONPATH=. $(TRIAL) subvertpy

clean::
	$(SETUP) clean

pydoctor:
	$(PYDOCTOR) -c subvertpy.cfg --make-html

epydoc:
	$(EPYDOC) subvertpy
