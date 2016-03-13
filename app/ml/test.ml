module B = Barcodescanner

let ( ^ ) (a : Js.js_string Js.t) (b : Js.js_string Js.t) =
  Js.string ((Js.to_string a) ^ (Js.to_string b))

let on_device_ready _ =
  let barcode = B.barcode_scanner () in
  barcode##(scan_err
    (
      fun res ->  Dom_html.window##(alert (res##.text ^ (Js.string "\n") ^
                  res##.format_))
    )
    (
      fun err -> Dom_html.window##(alert err))
    );

  (* Crash on a Nexus 5, android 6.0.1 *)
  (*
  barcode##(encode_err
    (B.encode_format_to_str B.encode_text)
    (Js.string "https://danny-willems.be")
    (fun str -> Dom_html.window##(alert str))
    (fun err -> Dom_html.window##(alert err))
  );
  *)
  Js._false

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
