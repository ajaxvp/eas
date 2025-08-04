OUT=eas
SOURCES := $(notdir $(shell find src -name '*.c'))
OBJECTS := $(addprefix build/,$(addsuffix .o,$(basename $(SOURCES))))

.PHONY: default clean

default: $(OUT)

clean:
	rm -f $(OUT) $(OBJECTS)
	rm -rf build

$(OUT): $(OBJECTS)
	ecc -o $(OUT) $^

build/%.o: src/%.c build
	ecc -c -o $@ $<

build:
	mkdir -p build
