open Ctypes
module T = Types_generated

module Functions (F : Ctypes.FOREIGN) = struct
  open F

  let js_NewContextRaw =
    foreign "JS_NewContextRaw"
      (ptr T.js_runtime @-> returning (ptr T.js_context))

  let js_AddIntrinsicBaseObjects =
    foreign "JS_AddIntrinsicBaseObjects" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicDate =
    foreign "JS_AddIntrinsicDate" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicEval =
    foreign "JS_AddIntrinsicEval" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicStringNormalize =
    foreign "JS_AddIntrinsicStringNormalize"
      (ptr T.js_context @-> returning void)

  let js_AddIntrinsicRegExpCompiler =
    foreign "JS_AddIntrinsicRegExpCompiler" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicRegExp =
    foreign "JS_AddIntrinsicRegExp" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicJSON =
    foreign "JS_AddIntrinsicJSON" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicProxy =
    foreign "JS_AddIntrinsicProxy" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicMapSet =
    foreign "JS_AddIntrinsicMapSet" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicTypedArrays =
    foreign "JS_AddIntrinsicTypedArrays" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicPromise =
    foreign "JS_AddIntrinsicPromise" (ptr T.js_context @-> returning void)

  let js_AddIntrinsicWeakRef =
    foreign "JS_AddIntrinsicWeakRef" (ptr T.js_context @-> returning void)

  (*

  let js_init_module_std =
    foreign "js_init_module_std"
      (ptr T.js_context
      @-> const (ptr char)
      @-> returning @@ ptr T.js_module_def)

  let js_init_module_os =
    foreign "js_init_module_os"
      (ptr T.js_context
      @-> ptr (const char)
      @-> returning @@ ptr T.js_module_def)

  let js_std_add_helpers =
    foreign "js_std_add_helpers"
      (ptr T.js_context @-> int @-> ptr (ptr char) @-> returning void)

  let js_std_loop = foreign "js_std_loop" (ptr T.js_context @-> returning void)

  (*
  let js_std_await =
    foreign "js_std_await"
      (ptr T.js_context @-> T.js_value @-> returning T.js_value)
      *)

  let js_std_init_handlers =
    foreign "js_std_init_handlers" (ptr T.js_runtime @-> returning void)

  let js_std_free_handlers =
    foreign "js_std_free_handlers" (ptr T.js_runtime @-> returning void)

  let js_std_dump_error =
    foreign "js_std_dump_error" (ptr T.js_context @-> returning void)

  let js_load_file =
    foreign "js_load_file"
      (ptr T.js_context @-> ptr size_t
      @-> ptr (const char)
      @-> returning (ptr uint8_t))

  let js_module_set_import_meta =
    foreign "js_module_set_import_meta"
      (ptr T.js_context @-> T.js_value_const @-> T.js_bool @-> T.js_bool
     @-> returning int)

  let js_module_test_json =
    foreign "js_module_test_json"
      (ptr T.js_context @-> T.js_value_const @-> returning int)

  let js_module_check_attributes =
    foreign "js_module_check_attributes"
      (ptr T.js_context @-> ptr void @-> T.js_value_const @-> returning int)

  let js_module_loader =
    foreign "js_module_loader"
      (ptr T.js_context
      @-> ptr (const char)
      @-> ptr void @-> T.js_value @-> returning @@ ptr T.js_module_def)

  let js_std_eval_binary =
    foreign "js_std_eval_binary"
      (ptr T.js_context
      @-> ptr (const uint8_t)
      @-> size_t @-> int @-> returning void)

  let js_std_eval_binary_json_module =
    foreign "js_std_eval_binary_json_module"
      (ptr T.js_context
      @-> ptr (const uint8_t)
      @-> size_t
      @-> ptr (const char)
      @-> returning void)

  (*
  let js_std_promise_rejection_tracker =
    foreign "js_std_promise_rejection_tracker"
      (ptr T.js_context @-> T.js_value_const @-> T.js_value_const @-> T.js_bool
     @-> ptr void @-> returning void)
     *)

*)
  let js_NewRuntime =
    foreign "JS_NewRuntime" (void @-> returning @@ ptr T.js_runtime)

  let js_FreeRuntime =
    foreign "JS_FreeRuntime" (ptr T.js_runtime @-> returning void)

  let js_NewContext =
    foreign "JS_NewContext" (ptr T.js_runtime @-> returning @@ ptr T.js_context)

  let js_FreeContext =
    foreign "JS_FreeContext" (ptr T.js_context @-> returning void)

  let js_DupContext =
    foreign "JS_DupContext" (ptr T.js_context @-> returning @@ ptr T.js_context)

  let js_GetContextOpaque =
    foreign "JS_GetContextOpaque" (ptr T.js_context @-> returning void)

  let js_get_exception =
    foreign "JS_GetException" (ptr T.js_context @-> returning T.js_value)

  let js_has_exception =
    foreign "JS_HasException" (ptr T.js_context @-> returning T.js_bool)

  let js_eval =
    foreign "JS_Eval"
      (ptr T.js_context @-> string @-> size_t @-> string @-> uint32_t
     @-> returning T.js_value)

  let js_to_cstring_len2 =
    foreign "JS_ToCStringLen2"
      (ptr T.js_context @-> ptr_opt size_t @-> T.js_value @-> T.js_bool
     @-> returning @@ string_opt)

  let js_to_cstring =
    foreign "JS_ToCString"
      (ptr T.js_context @-> T.js_value_const @-> returning @@ string_opt)

  (*
  let js_SetContextOpaque =
    foreign "JS_SetContextOpaque"
      (ptr T.js_context @-> ptr void @-> returning void)

  let js_GetRuntime =
    foreign "JS_GetRuntime" (ptr T.js_context @-> returning T.js_runtime)
    *)
end
