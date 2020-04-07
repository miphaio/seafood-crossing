main: run

run:
	@echo "[INFO] Running for devleopment"

build: build-ios

build-ios:
	@echo "[INFO] Building for IOS"
	@flutter build ios --release
