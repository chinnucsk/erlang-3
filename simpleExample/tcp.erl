-module(tcp).
-export([start_client/1, start_server/0]).
-export([print_time/1]).
-export([server/1]).
-export([client/2]).
-export([loop_client/2]).
-export([client_helper/2]).

server(Port) ->
  {ok, LSocket} = gen_tcp:listen(Port, [binary]),
  {ok, Socket} = gen_tcp:accept(LSocket),
  loop_server(Socket).

loop_server(Socket) ->
  receive
    {tcp, Socket, Request} ->
      io:format("~s ~n", [Request]),
      loop_server(Socket)
  end.

client(Socket, Client_no) ->
  if 
    Client_no > 0 ->
      Id = 0,
      loop_client(Socket, Id);
    true ->
      gen_tcp:close(Socket)
  end.

loop_client(Socket, Id) when Id < 5 ->
  ok = gen_tcp:send(Socket, "Client Request!"),
  loop_client(Socket, Id + 1);
loop_client(Socket, Id) ->
  done.

start_client(Client_no) ->
  HostInNet = "127.0.0.1",
  {ok, Socket} = gen_tcp:connect(HostInNet, 5678, [binary]),
  client_helper(Client_no, Socket).

client_helper(Client_no, Socket) ->
  if
    Client_no > 0 ->
      io:format("~w~n", [Client_no]),
      spawn(tcp, client, [Socket, Client_no]),
      client_helper(Client_no - 1, Socket);
    true ->
      done
  end.

print_time(N) ->
  erlang:send_after(1000, self(), "1 sencond"),
  receive
    "1 sencond" ->
      io:format("~w seconds passed!~n", [N])
  end,
  print_time(N + 1).

start_server() ->
  spawn(tcp, print_time, [1]),
  spawn(tcp, server, [5678]).

