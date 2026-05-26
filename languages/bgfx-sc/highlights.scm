; Base GLSL-ish highlighting
(preproc_directive) @preproc
(comment) @comment
(number_literal) @number
(string_literal) @string

(identifier) @variable
(type_identifier) @type
(field_identifier) @property

(function_declarator
  (identifier) @function)

(call_expression
  function: (identifier) @function)

; Keywords and builtin types matched safely through identifiers.
((identifier) @keyword
  (#match? @keyword "^(if|else|for|while|do|switch|case|default|break|continue|return|discard|struct|uniform|in|out|inout|const|varying)$"))

((type_identifier) @type.builtin
  (#match? @type.builtin "^(void|bool|int|uint|float|vec2|vec3|vec4|ivec2|ivec3|ivec4|uvec2|uvec3|uvec4|bvec2|bvec3|bvec4|mat2|mat3|mat4|mat2x2|mat2x3|mat2x4|mat3x2|mat3x3|mat3x4|mat4x2|mat4x3|mat4x4|sampler2D|sampler2DArray|sampler2DShadow|samplerCube|sampler3D)$"))

((identifier) @type.builtin
  (#match? @type.builtin "^(void|bool|int|uint|float|vec2|vec3|vec4|ivec2|ivec3|ivec4|uvec2|uvec3|uvec4|bvec2|bvec3|bvec4|mat2|mat3|mat4|mat2x2|mat2x3|mat2x4|mat3x2|mat3x3|mat3x4|mat4x2|mat4x3|mat4x4|sampler2D|sampler2DArray|sampler2DShadow|samplerCube|sampler3D)$"))

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
  (#match? @function.builtin "^(SAMPLER2D|SAMPLER2DARRAY|SAMPLER2DSHADOW|SAMPLERCUBE|SAMPLER3D|IMAGE2D|IMAGE3D|IMAGECUBE|IMAGE2DARRAY|BUFFER_RO|BUFFER_RW|BUFFER_WO|IMAGE_RO|IMAGE_RW|IMAGE_WO|NUM_THREADS|mul|saturate|lerp|vec2_splat|vec3_splat|vec4_splat|mtxFromCols|mtxFromRows|toClipSpaceDepth|encodeNormalUint|decodeNormalUint)$"))

((identifier) @constant.builtin
  (#match? @constant.builtin "^(BGFX_SHADER_LANGUAGE_|BGFX_SHADER_TYPE_|BX_PLATFORM_)"))

; Common bgfx naming conventions
((identifier) @constant
  (#match? @constant "^u_[A-Za-z0-9_]+$"))

((identifier) @property
  (#match? @property "^s_[A-Za-z0-9_]+$"))

((identifier) @variable.special
  (#match? @variable.special "^v_[A-Za-z0-9_]+$"))

((identifier) @variable.parameter
  (#match? @variable.parameter "^a_[A-Za-z0-9_]+$"))

((identifier) @variable.special
  (#match? @variable.special "^(gl_Position|gl_FragCoord|gl_FragColor|gl_InstanceID|gl_VertexID)$"))
