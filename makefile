main: run

run:
	@echo "[INFO] Running for development"
	@flutter run

doctor:
	@echo "[INFO] Running flutter doctor"
	@flutter doctor

build: build-ios

build-ios:
	@echo "[INFO] Building for iOS"
	@flutter build ios --release
