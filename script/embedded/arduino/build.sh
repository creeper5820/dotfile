arduino-cli compile \
--build-path ./build \
--fqbn esp32:esp32:esp32 \
--build-cache-path ./build/core \
--build-property="build.extra_flags=-DESP32" \
--jobs 12 \
.