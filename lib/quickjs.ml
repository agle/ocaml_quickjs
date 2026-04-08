module JS = QuickJS.Functions

exception QuickJSEerror of string

let check_error ctx =
  let open JS in
  if js_has_exception ctx == 1 then
    let e = js_get_exception ctx in
    let s = js_to_cstring ctx e in
    match s with Some s -> raise (QuickJSEerror s) | None -> ()

let eval_str ctx js n =
  let e =
    JS.js_eval ctx js
      (String.length js |> Unsigned.Size_t.of_int)
      n Unsigned.UInt32.zero
  in
  check_error ctx;
  e

let new_string ctx str =
  JS.js_newstring_len ctx str (Unsigned.Size_t.of_int @@ String.length str)

let eval_str_ret_str ctx ?(filename = "<file>") js =
  let r =
    JS.js_eval ctx js
      (String.length js |> Unsigned.Size_t.of_int)
      filename Unsigned.UInt32.zero
  in
  let r = JS.js_to_cstring ctx r in
  check_error ctx;
  r
