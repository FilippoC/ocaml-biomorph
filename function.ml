open Complex;;

(* complex sinus *)
let (sin : Complex.t -> Complex.t) = function v ->
    { re = sin v.re *. cosh v.im ; im = cos v.re *. sinh v.im}
;;

(* z^3 + c *)
let (z1 : Complex.t -> Complex.t -> Complex.t) = function c -> function z ->
    (add (pow z { re = 3.0 ; im = 0.0}) c)
;;

(* sin(z) + e^z + c *)
let (z2 : Complex.t -> Complex.t -> Complex.t) = function c -> function z ->
    add (add (sin z) (exp z)) c
;;

(* z^z + z^6 + c *)
let (z3 : Complex.t -> Complex.t -> Complex.t) = function c -> function z ->
    add (add (pow z z) (pow z {re = 6.0 ; im = 0.0})) c
;;
