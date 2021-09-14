-module(day01).
-export([function_test/0]).


function_test() ->
    Cmd = os:cmd("ls"),
    io:format("The result of ls is:~p~n", [Cmd]),
    Cmd.


