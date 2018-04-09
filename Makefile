PROGRAM = tests/run-tests
MODULES_DIR = modules
OBJECT_FILES = sources/xml.o tests/main.o

.PHONY: build clean run setup

build: setup ${PROGRAM}

run: build
	@${PROGRAM}

%.o: %.f90
	${CC} -Wall -J ${MODULES_DIR} -o $@ -c $^

${PROGRAM}: ${OBJECT_FILES}
	${CC} -o $@ $^ -lgfortran -lxml2

setup: ${MODULES_DIR}

${MODULES_DIR}:
	mkdir -p $@

clean:
	rm -rf ${PROGRAM} ${OBJECT_FILES} ${MODULES_DIR}
