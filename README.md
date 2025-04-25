# Setup

- download and install Godot 4.4 (.NET)
- edit `Makefile` to set the `GODOT_EXECUTABLE_PATH` (TODO: env var?)

# Building

- `make build` will prepare Godot `assets/` and build dotnet `src/`, but is slow.
- `make run` will run your game.
- A faster workflow is to leave `make watch-src` running, and when you need to modify assets, either use the Godot Editor (untested still,) or manually modify `assets/` files and run `make build-assets`
