; Base GLSL-ish highlighting
(preproc_directive) @preproc
(comment) @comment
(number_literal) @number
(string_literal) @string

(identifier) @variable
(type_identifier) @type

(function_declarator
  (identifier) @function)

(call_expression
  function: (identifier) @function)

[
  "if"
  "else"
  "for"
  "while"
  "do"
  "switch"
  "case"
  "default"
  "break"
  "continue"
  "return"
  "discard"
] @keyword

[
  "struct"
  "uniform"
  "in"
  "out"
  "inout"
  "const"
  "varying"
] @keyword

[
  "void"
  "bool"
  "int"
  "uint"
  "float"
  "vec2"
  "vec3"
  "vec4"
  "mat2"
  "mat3"
  "mat4"
  "sampler2D"
  "samplerCube"
] @type.builtin

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
] @operator

; bgfx shaderc builtins/macros
((identifier) @preproc
  (#match? @preproc "^\\$(input|output)$"))

((identifier) @function.builtin
  (#match? @function.builtin "^(SAMPLER2D|SAMPLER2DARRAY|SAMPLERCUBE|IMAGE2D|mul|saturate|lerp|vec4_splat|mtxFromCols|mtxFromRows)$"))

((identifier) @constant.builtin
  (#match? @constant.builtin "^BGFX_SHADER_LANGUAGE_"))
