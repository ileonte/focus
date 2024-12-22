```bash
docker run --platform linux/arm64/v8 -v /usr/bin/qemu-aarch64:/usr/bin/qemu-aarch64:ro --rm -ti ubuntu:18.04
apt update
apt install build-essential cmake g++

# freetype
wget \
  https://sourceforge.net/projects/freetype/files/freetype2/2.12.1/freetype-2.12.1.tar.gz/download \
  -O freetype-2.12.1.tar.gz
tar xzvf freetype-2.12.1.tar.gz
cd freetype-2.12.1
mkdir build_dir
cd build_dir
cmake \
  -DFT_DISABLE_ZLIB=TRUE \
  -DFT_DISABLE_BZIP2=TRUE \
  -DFT_DISABLE_PNG=TRUE \
  -DFT_DISABLE_HARFBUZZ=TRUE \
  -DFT_DISABLE_BROTLI=TRUE \
  -DBUILD_SHARED_LIBS=false \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_CONFIGURATION_TYPES=RelWithDebInfo \
  ..
cmake --build .

# stb_image
gcc -O2 -ggdb -c stb_image.c -o stb_image.o
ar cru libstb_image.a stb_image.o
```
