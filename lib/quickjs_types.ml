open Ctypes

module Types (F : Ctypes.TYPE) = struct
  include F

  type js_bool = int typ

  let js_bool = int

  type struct_js_runtime

  let struct_js_runtime : struct_js_runtime structure typ =
    structure "JSRuntime"

  type js_runtime

  let js_runtime = typedef struct_js_runtime "JSRuntime"

  type struct_js_context

  let struct_js_context : struct_js_context structure typ =
    structure "JSContext"

  type js_context

  let js_context = typedef struct_js_context "JSContext"

  type js_module_def

  let js_module_def : js_module_def structure typ = structure "JSModuleDef"

  type _js_value_union

  let _js_value_union : _js_value_union union typ = union "JSValueUnion"
  let int32 = field _js_value_union "int32" int32_t
  let loat64 = field _js_value_union "float64" double
  let ptr = field _js_value_union "ptr" (ptr void)
  let short_big_int = field _js_value_union "short_big_int" int64_t
  let () = seal _js_value_union

  type js_value_union

  let js_value_union = typedef _js_value_union "JSValueUnion"

  type struct_js_value

  let struct_js_value : struct_js_value structure typ = structure "JSValue"
  let u = field struct_js_value "u" js_value_union
  let tag = field struct_js_value "tag" int64_t
  let () = seal struct_js_value

  type js_value

  let js_value = typedef struct_js_value "JSValue"
  let js_value_const = js_value

  type js_class

  let js_class : js_class structure typ = structure "JSClass"

  type js_class_id

  let js_class_id = typedef uint32_t "JSClassID"
  let js_atom = typedef uint32_t "JSAtom"
end
