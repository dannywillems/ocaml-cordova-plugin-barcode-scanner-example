(* -------------------------------------------------------------------------- *)
type encode_format  =
  | Text
  | Phone
  | Email
  | Sms

let encode_text     = Text
let encode_phone    = Phone
let encode_email    = Email
let encode_sms      = Sms

let encode_format_to_str f = match f with
  | Text    -> Js.string "TEXT_TYPE"
  | Phone   -> Js.string "PHONE_TYPE"
  | Email   -> Js.string "EMAIL_TYPE"
  | Sms     -> Js.string "SMS_TYPE"
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type result =
  <
    text        : Js.js_string Js.t Js.readonly_prop ;
    format_     : Js.js_string Js.t Js.readonly_prop ;
    cancelled   : bool Js.t Js.readonly_prop
  > Js.t

(* TODO
 * Which formats could we have ?
 * ??
type decode_format =
  | All_1d
  | Aztec
  | Codebar
  | Code_128
  | Code_39
  | Code_93
  | Data_matrix
  | Ean_13
  | Ean_8
  | Itf
  | Maxicode
  | Msi
  | Pdf_417
  | Plessey
  | Qr_code
  | Rss_14
  | Rss_expanded
  | Upc_a
  | Upc_e
  | Upc_ean_extension

let decode_format_to_type str = match str with
  | ...

let result_to_ocaml r =
  object
    val text    = Js.to_string r##.text
    val format_ = decode_format_to_type r##.format_
    val cancelled = Js.to_bool r##.cancelled
  end
*)
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class type barcode_scanner =
  object
    (* ---------------------------------------------------------------------- *)
    (* scan [success_callback] *)
    method scan       : (result -> unit) -> unit Js.meth
    (* scan [success_callback] [error_callback] *)
    method scan_err   : (result -> unit) ->
                        (Js.js_string Js.t -> unit) ->
                        unit Js.meth
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    (* encore [type] [data] [success_callback] *)
    method encode     : Js.js_string Js.t -> Js.js_string Js.t ->
                        (Js.js_string Js.t -> unit) ->
                        unit Js.meth
    (* encore [type] [data] [success_callback] [error_callback] *)
    method encode_err : Js.js_string Js.t -> Js.js_string Js.t ->
                        (Js.js_string Js.t -> unit) ->
                        (Js.js_string Js.t -> unit) ->
                        unit Js.meth
    (* ---------------------------------------------------------------------- *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
let barcode_scanner () = Js.Unsafe.js_expr ("cordova.plugins.barcodeScanner")
(* -------------------------------------------------------------------------- *)
