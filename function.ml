open Complex;;

let z1 = function (c : Complex.t) -> function (x : Complex.t) ->
    (add (pow x { re = 3.0 ; im = 0.0}) c)
;;
