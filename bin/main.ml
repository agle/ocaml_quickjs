open Oquickjs.QuickJS.Functions

let blob = [%blob "../vendored/katex.js"]
let () = Printexc.record_backtrace true
let rt = js_NewRuntime ()
let ctx = js_NewContext rt

let mk_katex tex display =
  let b = if display then "true" else "false" in
  let s =
    Printf.sprintf "katex.renderToString(\"%s\", {displayMode: %s})" tex b
  in
  print_endline s;
  s

let eval_str js n =
  js_eval ctx js
    (String.length js |> Unsigned.Size_t.of_int)
    n Unsigned.UInt32.zero

let eval_str_ret js n =
  let r =
    js_eval ctx js
      (String.length js |> Unsigned.Size_t.of_int)
      n Unsigned.UInt32.zero
  in
  let r = js_to_cstring ctx r in
  r

let checkexc () =
  if js_has_exception ctx == 1 then
    let e = js_get_exception ctx in
    let s = js_to_cstring ctx e in
    match s with
    | Some s -> print_endline s
    | None -> print_endline "none exception"

(*
  let r = Ctypes_std_views.string_of_char_ptr r in
  r*)

let () =
  eval_str_ret blob "katex.min.js" |> ignore;
  checkexc ();
  eval_str_ret (mk_katex "\\KaTeX" true) "text" |> Option.iter print_endline;
  checkexc ()
