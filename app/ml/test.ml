module B = Cordova_barcode_scanner

let on_device_ready _ =
  let print_res res =
    Jsoo_lib.alert ((B.result_text res) ^ "\n" ^ (B.result_format res))
  in
  B.scan print_res ();
  ()

let _ =
  Cordova.Event.device_ready on_device_ready
