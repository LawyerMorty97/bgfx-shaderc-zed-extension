; Base GLSL-ish highlighting
(preproc_directive) @preproc
(comment) @comment
(number_literal) @number
(char_literal) @number
(string_literal) @string
(system_lib_string) @string

(identifier) @variable
(type_identifier) @type
(primitive_type) @type.builtin
(sized_type_specifier) @type.builtin
(field_identifier) @property
(statement_identifier) @label

(function_declarator
  declarator: (identifier) @function)

(function_declarator
  (identifier) @function)

(call_expression
  function: (identifier) @function)

(call_expression
  function: (field_expression
    field: (field_identifier) @function))

(preproc_function_def
  name: (identifier) @function.special)

[
  "break"
  "case"
  "const"
  "continue"
  "default"
  "do"
  "else"
  "enum"
  "extern"
  "for"
  "if"
  "inline"
  "return"
  "sizeof"
  "static"
  "struct"
  "switch"
  "typedef"
  "union"
  "volatile"
  "while"
] @keyword

[
  "in"
  "out"
  "inout"
  "uniform"
  "shared"
  "layout"
  "attribute"
  "varying"
  "buffer"
  "coherent"
  "readonly"
  "writeonly"
  "precision"
  "highp"
  "mediump"
  "lowp"
  "centroid"
  "sample"
  "patch"
  "smooth"
  "flat"
  "noperspective"
  "invariant"
  "precise"
] @type.qualifier

"subroutine" @keyword.function
(extension_storage_class) @keyword.storage

; Extra bgfx/GLSL words that may parse as identifiers in shaderc-flavoured code.
((identifier) @keyword
  (#match? @keyword "^(discard)$"))

((type_identifier) @type.builtin
  (#match? @type.builtin "^(void|bool|int|uint|float|vec2|vec3|vec4|ivec2|ivec3|ivec4|uvec2|uvec3|uvec4|bvec2|bvec3|bvec4|mat2|mat3|mat4|mat2x2|mat2x3|mat2x4|mat3x2|mat3x3|mat3x4|mat4x2|mat4x3|mat4x4|sampler2D|sampler2DArray|sampler2DShadow|samplerCube|sampler3D|sampler2DMS|isampler2D|usampler2D|isampler3D|usampler3D|isamplerCube|usamplerCube|isampler2DMS|usampler2DMS)$"))

((identifier) @type.builtin
  (#match? @type.builtin "^(void|bool|int|uint|uint2|uint3|uint4|float|vec2|vec3|vec4|ivec2|ivec3|ivec4|uvec2|uvec3|uvec4|bvec2|bvec3|bvec4|mat2|mat3|mat4|mat2x2|mat2x3|mat2x4|mat3x2|mat3x3|mat3x4|mat4x2|mat4x3|mat4x4|sampler2D|sampler2DArray|sampler2DShadow|samplerCube|sampler3D|sampler2DMS|isampler2D|usampler2D|isampler3D|usampler3D|isamplerCube|usamplerCube|isampler2DMS|usampler2DMS)$"))

[
  "+"
  "-"
  "*"
  "/"
  "%"
  "="
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "&&"
  "||"
  "!"
  "++"
  "--"
  "+="
  "-="
  "*="
  "/="
] @operator

; bgfx shaderc builtins/macros
((identifier) @preproc
  (#match? @preproc "^\\$(input|output|raw|end)$"))

((identifier) @function.builtin
  (#match? @function.builtin "^(SAMPLER2D|SAMPLER2DARRAY|SAMPLER2DSHADOW|SAMPLERCUBE|SAMPLER3D|IMAGE2D|IMAGE3D|IMAGECUBE|IMAGE2DARRAY|BUFFER_RO|BUFFER_RW|BUFFER_WO|IMAGE_RO|IMAGE_RW|IMAGE_WO|NUM_THREADS|mul|saturate|lerp|vec2_splat|vec3_splat|vec4_splat|mtxFromCols|mtxFromRows|toClipSpaceDepth|encodeNormalUint|decodeNormalUint|texture2D|texture2DProj|texture2DLod|texture2DProjLod|texture2DGrad|texture2DProjGrad|texture2DArray|texture2DArrayLod|texture2DLodOffset|texture3D|texture3DProj|texture3DLod|texture3DProjLod|texture3DGrad|texture3DProjGrad|textureCube|textureCubeLod|textureCubeGrad|shadow2D|shadow2DProj|shadow2DLod|shadow2DProjLod|shadow2DArray|textureSize|texelFetch|texelFetchOffset|dFdx|dFdy|fwidth|bitfieldReverse|floatBitsToInt|floatBitsToUint|intBitsToFloat|uintBitsToFloat|packHalf2x16|unpackHalf2x16)$"))

((identifier) @constant.builtin
  (#match? @constant.builtin "^(BGFX_SHADER_LANGUAGE_|BGFX_SHADER_TYPE_|BX_PLATFORM_)"))

; Common bgfx naming conventions
((identifier) @constant
  (#match? @constant "^u_[A-Za-z0-9_]+$"))

((identifier) @property
  (#match? @property "^s_[A-Za-z0-9_]+$"))

((identifier) @variable.special
  (#match? @variable.special "^v_[A-Za-z0-9_]+$"))

; shaderc official vertex attributes / instance data inputs
((identifier) @variable.parameter
  (#match? @variable.parameter "^(a_position|a_normal|a_tangent|a_bitangent|a_color[0-3]|a_indices|a_weight|a_texcoord[0-7]|i_data[0-4])$"))

; Fallback for project-specific attributes.
((identifier) @variable.parameter
  (#match? @variable.parameter "^a_[A-Za-z0-9_]+$"))

((identifier) @variable.special
  (#match? @variable.special "^(gl_Position|gl_FragCoord|gl_FragColor|gl_InstanceID|gl_VertexID|gl_ViewportIndex|gl_Layer)$"))

((identifier) @variable.builtin
  (#match? @variable.builtin "^gl_"))
