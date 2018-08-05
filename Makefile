.SILENT:

all: build build/CMakeLists.txt.copy
	$(MAKE) --no-print-directory -C build

clean:
	rm -rf build bin lib

build/CMakeLists.txt.copy: CMakeLists.txt Makefile build
	cd build && cmake -DCMAKE_BUILD_TYPE=Release \.. && \
	cp ../CMakeLists.txt CMakeLists.txt.copy

build:
	mkdir -p build

cleanup_cache:
	rm -rf build
