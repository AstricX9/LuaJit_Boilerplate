# LuaJIT Boilerplate

A small Windows starter project for building LuaJIT applications with GLFW and
OpenGL. The included example opens a 960 × 540 window, clears it to a dark
background, and closes when `Esc` is pressed.

## Requirements

- Windows
- No separate LuaJIT, GLFW, or stb_image installation is required; the
  required runtime files are included in `lib`.

## Running

Double-click `run.bat`, or run it from a command prompt:

```bat
run.bat
```

The script adds `lib` to `PATH`, sets the Lua module search path, and launches
`main.lua` with the bundled LuaJIT executable.

## Project layout

```text
.
├── main.lua       # Application entry point
├── run.bat        # Windows launcher
└── lib/           # LuaJIT and native runtime libraries
```

## Development

Edit `main.lua` to add application code. The example uses LuaJIT's FFI to call
the GLFW and OpenGL APIs directly.

Press `Esc` to close the sample window.
