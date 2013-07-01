-module(ask_area).
-export([area/0]).

-spec(area() -> number()).
area() ->
  Char = io:get_line("R)ectangle, T)riangle, or E)llipse > "),
  Shape = char_to_shape(hd(Char)),
  case Shape of
  	rectangle ->
  	  {N1, N2} = get_dimensions("width", "height");
    triangle ->
      {N1, N2} = get_dimensions("base", "height");
    ellipse ->
      {N1, N2} = get_dimensions("width", "height")
  end,
  calculate(Shape, N1, N2).


-spec(char_to_shape(char()) -> atom()).
char_to_shape(Char) ->
  case Char of
  	$R ->
  	  rectangle;
  	$r ->
  	  rectangle;
  	$T ->
  	  triangle;
  	$t ->
  	  triangle;
  	$E -> 
  	  ellipse;
  	$e ->
  	  ellipse;
  	_ ->
  	  unknown
  end.

-spec(get_dimensions(string(), string()) -> {number(), number()}).
get_dimensions(A, B) ->
  N1 = get_number(A),
  N2 = get_number(B),
  {N1, N2}.

-spec(get_number(string()) -> number()).
get_number(Prompt) ->
  Input = io:get_line("Enter " ++ Prompt ++ " > "),
  {Test, _} = string:to_float(Input),
  case Test of
  	error ->
      {N, _} = string:to_integer(Input);
    _ ->
      N = Test
  end,
  N.

-spec(calculate(atom(), number(), number()) -> number()).
calculate(unknown, _, _) ->
  io:format("wrong shap ~n");
calculate(_, error, _) ->
  io:format("First dimension has errors ~w~n", [error]);
calculate(_, _, error) ->
  io:format("Second dimension has errors ~w~n", [error]);
calculate(_, Dimension1, Dimension2) when  Dimension1 < 0; Dimension2 < 0 ->
  io:format("Both Dimensions should be positive~n");
calculate(Shape, Dimension1, Dimension2) ->
  geom:area(Shape, Dimension1, Dimension2).



