CFLAGS=-c -Wall -O3 -g -std=c99
#recommended options: -ffast-math -ftree-vectorize -march=core2 -mssse3 -O3
COPTS=
LDFLAGS=-lz -lm
SOURCES=SeqPrep.c utils.c stdaln.c
OBJECTS=$(SOURCES:.c=.o)
EXECUTABLE=seqprep

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) ${COPTS} $(OBJECTS) $(LDFLAGS) -o $@

install: all
	-cp $(EXECUTABLE) $(HOME)/bin

.c.o:
	$(CC) ${COPTS} $(CFLAGS) $< -o $@

clean:
	-rm -f $(OBJECTS) $(EXECUTABLE)

check-syntax:
	$(CC) ${CFLAGS} -o .nul -S ${CHK_SOURCES}
