.PHONY: build run test clean

GODOT = /Applications/Godot_mono_v4.4.app/Contents/MacOS/Godot

clean:
	rm -rf .godot/ obj/

lint:
	dotnet format --verify-no-changes

lint-fix:
	dotnet format

build:
	$(GODOT) --headless --build-solutions --quit

build-assets:
	$(GODOT) --headless --editor --quit

build-src:
	dotnet build

run:
	$(GODOT) --run

run-loop:
	while true; do $(GODOT) --run; done

test:
	$(GODOT) --headless --scene res://test_scene.tscn

watch-assets:
	./watch-assets.sh

watch-src:
	dotnet watch build
