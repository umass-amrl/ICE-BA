.SILENT:

#acceptable build_types: Release/Debug/Profile
build_type=Release
# build_type=Debug

all: build build/CMakeLists.txt.copy
	$(MAKE) --no-print-directory -C build

clean:
	rm -rf build bin lib

build/CMakeLists.txt.copy: CMakeLists.txt Makefile build
	cd build && cmake -DCMAKE_BUILD_TYPE==$(build_type) \.. && \
	cp ../CMakeLists.txt CMakeLists.txt.copy

build:
	mkdir -p build

cleanup_cache:
	rm -rf build
