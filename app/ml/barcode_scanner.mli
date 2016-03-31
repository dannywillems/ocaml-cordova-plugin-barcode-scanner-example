(* -------------------------------------------------------------------------- *)
type encode_format  =
  | Text  [@js "TEXT_TYPE"]
  | Phone [@js "PHONE_TYPE"]
  | Email [@js "EMAIL_TYPE"]
  | Sms   [@js "SMS_TYPE"]
  [@@js.enum]

[@@@js.stop]
val encode_email          : encode_format
val encode_sms            : encode_format
val encode_text           : encode_format
val encode_phone          : encode_format
[@@@js.start]

[@@@js.implem
let encode_text     = Text
let encode_phone    = Phone
let encode_email    = Email
let encode_sms      = Sms
]
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class result : Ojs.t ->
  object
    inherit Ojs.obj

    method text       : string
    method format     : string
    method cancelled  : bool
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
class barcode_scanner : Ojs.t ->
  object
    inherit Ojs.obj

    (* ---------------------------------------------------------------------- *)
    (* scan [success_callback] ?[error_callback] *)
    method scan   : (result -> unit)                                        ->
                    ?err_cb:((string -> unit) [@js.default (fun e -> ())])  ->
                    unit                                                    ->
                    unit
    (* ---------------------------------------------------------------------- *)

    (* ---------------------------------------------------------------------- *)
    (* encore [type] [data] [success_callback] [error_callback] *)
    method encode : string                                                  ->
                    string                                                  ->
                    (string -> unit)                                        ->
                    ?err_cb:((string -> unit) [@js.default (fun e -> ())])  ->
                    unit                                                    ->
                    unit
    (* ---------------------------------------------------------------------- *)
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> barcode_scanner
[@@js.get "cordova.plugins.barcodeScanner"]
(* -------------------------------------------------------------------------- *)
