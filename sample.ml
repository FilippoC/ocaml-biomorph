open Complex;;

let stop_condition = function value ->
    abs_float value.re > 10.0 
    || abs_float value.im > 10.0
    || norm2 value > 100.0
in
let get_color = function value ->
    if abs_float value.re < 10.0 || abs_float value.im < 10.0
    then
        (0, 0, 0)
    else
        (255, 255, 255)
in
let z = Function.z1 { re = 0.5 ; im = 0.0 } in
let compute_plot_color = Compute.plot_color z 10 stop_condition get_color in
    Gui.draw (800, 800) (Gui.auto_graph_dim 1.5) compute_plot_color
;;
