let (plot_color :
        (Complex.t -> Complex.t) ->
        int ->
        (Complex.t -> bool) ->
        (Complex.t -> (int * int * int)) ->
        (float * float) ->
        (int * int * int)
    ) = 
    function sequence_function ->
    function nb_max_iter ->
    function stop_condition ->
    function get_color ->
    function (x, y) ->

    let rec compute = function nb -> function func -> function value ->
        if nb == 0
        then
            value
        else
            let nb = nb - 1 in
            let value = func value in
            if stop_condition value
            then
                value
            else
                compute nb func value
    in

    let value = compute nb_max_iter sequence_function { re = x ; im = y } in

    get_color value
;;
