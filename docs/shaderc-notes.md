# shaderc Reference Notes

This extension derives a subset of symbols, keywords, and conventions from bgfx shaderc.

Relevant upstream source:
https://github.com/bkaradzic/bgfx/tree/master/tools/shaderc

## Highlighted shaderc-specific concepts

### BGFX macros

- `$input`
- `$output`
- `$raw`
- `$end`
- `NUM_THREADS`
- `SAMPLER2D`
- `SAMPLERCUBE`
- `BUFFER_RO`
- `BUFFER_RW`
- `IMAGE_RO`
- `IMAGE_RW`

### Official vertex attributes

Derived from shaderc.cpp:

- `a_position`
- `a_normal`
- `a_tangent`
- `a_bitangent`
- `a_color0-3`
- `a_indices`
- `a_weight`
- `a_texcoord0-7`
- `i_data0-4`

### GLSL builtins/functions

Examples:

- `dFdx`
- `dFdy`
- `fwidth`
- `texelFetch`
- `texture2DLod`
- `textureCubeGrad`
- `packHalf2x16`
- `floatBitsToUint`

## Future ideas

- shaderc diagnostics integration
- include graph visualization
- shader dependency tracking
- hover documentation
- auto-complete
- hot-reload integration
