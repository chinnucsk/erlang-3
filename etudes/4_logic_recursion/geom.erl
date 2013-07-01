%% @author Zhaohui Zhang <bravezhaohui@gmail.com>
%% @doc Functions for calculating areas of geometric shaps
%% @version 0.1

-module(geom).
-export([area/2]).
-export([area/3]).
-export([area/1]).
-export([area2/3]).

%% @doc Calculates the areas of a rectangle, given the
%% length and width. Returns the product of its arguments
-spec(area(number(), number()) -> number()).
area(Length, Width) ->
  Length * Width.

-spec(area(atom(), number(), number()) -> number()).
area(rectangle, A, B) when A >= 0, B >= 0 ->
  A * B;
area(triangle, A, B) when A >= 0, B >= 0 ->
  A * B / 2.0;
area(ellipse, A, B) when A >= 0, B >= 0 ->
  math:pi() * A * B;
area(_, _, _) -> 0.

area({Shape, Dim1, Dim2}) ->
  area(Shape, Dim1, Dim2).

area2(Shape, A, B) when A >= 0, B >= 0 ->
  case Shape of
  	rectangle ->
  		A * B;
  	triangle ->
  	    A * B / 2.0;
  	ellipse ->
  	    math:pi() * A * B
  end.