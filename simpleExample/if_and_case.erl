-module(if_and_case).
-export([convert_length/1]).
-export([month_length/2]).

convert_length(Length) ->
  case Length of
    {centimeter, X} -> {inch, X / 2.54};
    {inch, Y} -> {centimeter, Y * 2.54}
  end.


%Tell the length of a month, given the year and month

month_length(Year, Month) ->
  Leap = if
    Year rem 400 == 0 ->
      leap;
    trunc(Year / 100) * 100 == Year ->
      not_leap;
    trunc(Year / 4) * 4 == Year ->
      leap;
    true ->
      not_leap
  end,

  case Month of
    sep -> 30;
    jan -> 31;
    mar -> 31;
    may -> 31;
    jul -> 31;
    aug -> 31;
    oct -> 31;
    dec -> 31;
    apr -> 30;
    jun -> 30;
    nov -> 30;
    feb when Leap == leap -> 29;
    feb -> 28
  end.


