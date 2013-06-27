-module(cities_temp).
-export([format_temps/1]).

format_temps(Lists_of_cities) ->
  Converted_list = convert_lists_to_c(Lists_of_cities),
  print_tmp(Converted_list),
  {Max_city, Min_city} = find_max_and_min(Converted_list),
  print_max_and_min(Max_city, Min_city).
  

convert_lists_to_c([{Name, {f, Temp}} | Rest]) ->
  Converted_city = {Name, {c, (Temp - 32) * 5 / 9}},
  [Converted_city | convert_lists_to_c(Rest)];
convert_lists_to_c([City | Rest]) ->
  [City| convert_lists_to_c(Rest)];
convert_lists_to_c([])->
  [].

print_tmp([{Name, {c, Temp}} | Rest]) ->
  io:format("~-15w ~w c ~n", [Name, Temp]),
  print_tmp(Rest);
print_tmp([]) ->
  ok.

find_max_and_min([First_city | Rest]) ->
  find_max_and_min(Rest, First_city, First_city).

find_max_and_min([{Name, {c, Temp}} | Rest], 
                  {Max_name, {c, Max_temp}}, {Min_name, {c, Min_temp}} ) ->
  if
    Temp > Max_temp ->
      Max_city = {Name, {c, Temp}};
    true ->
      Max_city = {Max_name, {c, Max_temp}}
  end,
  if
    Temp < Min_temp ->
      Min_city = {Name, {c, Temp}};
    true ->
      Min_city = {Min_name, {c, Min_temp}}
  end,
  find_max_and_min(Rest, Max_city, Min_city);
find_max_and_min([], Max_city, Min_city) ->
  {Max_city, Min_city}.

print_max_and_min({Max_name, {c, Max_temp}}, {Min_name, {c, Min_temp}}) ->
  io:format("Max temperature was ~w c in ~w~n", [Max_temp, Max_name]),
  io:format("Min temperature was ~w c in ~w~n", [Min_temp, Min_name]).




