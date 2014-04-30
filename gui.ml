let (draw :
        (int * int) -> 
        ((float * float) * (float * float)) -> 
        ((float * float) -> (int * int * int)) ->
        unit
    ) =

    function (size_x, size_y) -> 
    function ((x_min, x_max), (y_min, y_max)) ->
    function compute_plot_color ->
begin
    Graphics.open_graph "";
    Graphics.clear_graph ();
    Graphics.resize_window size_x size_y;
    (*Graphics.auto_synchronize false;*)

    let screen_to_graph = 
        function (screen_min, screen_max) -> 
        function (graph_min, graph_max) -> 
        function x ->
            let screen = float_of_int (screen_max - screen_min) in
            let graph = graph_max -. graph_min in
            (float_of_int (x - screen_min)) /. screen *. graph +. graph_min
    in

    for x = 0 to size_x - 1 do
    for y = 0 to size_y - 1 do
    begin
            let r, g, b = compute_plot_color
                    (
                        screen_to_graph (0, size_x) (x_min, x_max) x, 
                        screen_to_graph (0, size_y) (y_min, y_max) y
                    )
            in
            Graphics.set_color (Graphics.rgb r g b);
            Graphics.plot x y;
    end
    done
    done;

    Graphics.synchronize ();
    ignore (Graphics.wait_next_event []);
    ()
end;;

let (auto_graph_dim : float -> ((float * float) * (float * float))) = 
    function d -> ((-.d, d), (-.d, d))
;;
