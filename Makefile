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

run:
	$(GODOT) --run

test:
	$(GODOT) --headless --scene res://test_scene.tscn

watch:
	fswatch -o . | xargs -n1 -I{} $(GODOT) --headless --build-solutions

watch-cs:
	fswatch -o . --exclude '.*' --include '.*\.cs$$' | xargs -n1 -I{} $(GODOT) --headless --build-solutions
