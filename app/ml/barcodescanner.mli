(* -------------------------------------------------------------------------- *)
type encode_format

val encode_email          : encode_format
val encode_sms            : encode_format
val encode_text           : encode_format
val encode_phone          : encode_format

val encode_format_to_str  : encode_format -> Js.js_string Js.t
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
type result =
  <
    text        : Js.js_string Js.t Js.readonly_prop ;
    format_     : Js.js_string Js.t Js.readonly_prop ;
    cancelled   : bool Js.t Js.readonly_prop
  > Js.t
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
val barcode_scanner : unit -> barcode_scanner Js.t
(* -------------------------------------------------------------------------- *)
