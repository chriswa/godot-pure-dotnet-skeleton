.PHONY: build run test clean

GODOT_EXECUTABLE_PATH = /Applications/Godot_mono_v4.4.app/Contents/MacOS/Godot

clean:
	rm -rf .godot/ obj/

lint:
	dotnet format --verify-no-changes

lint-fix:
	dotnet format

build:
	$(GODOT_EXECUTABLE_PATH) --headless --build-solutions --quit

build-assets:
	$(GODOT_EXECUTABLE_PATH) --headless --editor --quit

build-src:
	dotnet build

run:
	$(GODOT_EXECUTABLE_PATH) --run

run-loop:
	while true; do $(GODOT_EXECUTABLE_PATH) --run; done

test:
	$(GODOT_EXECUTABLE_PATH) --headless --scene res://test_scene.tscn

watch-assets:
	./watch-assets.sh

watch-src:
	dotnet watch build
