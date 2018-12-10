CC=gcc
CFLAGS=-pthread -g
LDFLAGS=-lpthread
LNK_DEST=$(shell pwd)

export CC
export CFLAGS
export LDFLAGS
export LNK_DEST

all: run-test-simple-pthread run-t-test run-test-futex-lock run-test-fork run-test-basic run-test-serial run-test-openMP #run-test-python run-test-MPI

run-test-simple-pthread: $(wildcard test-simple-pthread/*.c)
	$(MAKE) -C test-simple-pthread

run-t-test: $(wildcard t-test1/*.c)
	$(MAKE) -C t-test1

run-test-futex-lock: $(wildcard futex-lock/*.c)
	$(MAKE) -C futex-lock

run-test-fork: $(wildcard test-fork/*.c)
	$(MAKE) -C test-fork

run-test-basic: $(wildcard test-basic/*.c)
	$(MAKE) -C test-basic

run-test-openMP: $(wildcard test-openMP/*.c)
	$(MAKE) -C test-openMP

#run-test-python: $(wildcard test-pyhton/*.c)
#	$(MAKE) -C test-python

#run-test-MPI: $(wildcard test-MPI/*.c)
#	$(MAKE) -C test-MPI

run-test-serial: $(wildcard test-serial/*.c)
	$(MAKE) -C test-serial

# Run all tests at once
run-all:
	@echo "Running stress tests for DMTCP Coordinator"
	@echo "\n"
	@echo "*****  Pthread testing  *****"
	./run-test-simple-pthread
	@echo "\n"
	@echo "*****  Multi-threading testing  *****"
	./run-t-test
	@echo "\n"
	@echo "*****  Futex lock testing  *****"
	./run-test-futex-lock
	@echo "\n"
	@echo "*****  Testing forks testing  *****"
	./run-test-fork
	@echo "\n"
	@echo "*****  Sleep and Print testing  *****"
	./run-test-basic
	@echo "\n"

.PHONY: clean
clean:
	$(MAKE) -C t-test1 clean
	$(MAKE) -C test-simple-pthread clean
	$(MAKE) -C futex-lock clean
	$(MAKE) -C test-fork clean
	$(MAKE) -C test-basic clean
	$(MAKE) -C test-openMP clean
	#$(MAKE) -C test-pyhton clean
	$(MAKE) -C test-MPI clean
	$(MAKE) -C test-serial clean
	rm -f ./run-*

.PHONY: clean-all
clean-all: clean
	rm -f dmtcp_restart*.sh
	rm -f ckpt_*.dmtcp

.PHONY: dist
dist:
	(cd .. && tar czf cs-5600-project.tar.gz cs-5600-project)
