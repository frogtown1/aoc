-module(day01).
-include_lib("eunit/include/eunit.hrl").

-export([results/0]).

%% === Wrapper Function =================
results() ->
    io:format("Part 1: ~p~n", [part1()]).

%% ======================================



%% === Part 1 ===========================
part1() -> solver_part1(input_file()),
hd([{X, Y} || X <- Results, Y <- Results, X + Y == 2020]).


[A*B || A <- Input, B <- Input, A + B =:= 2020].





input_file() ->
    FilePath = filename:join(["..", "resources", "input01"]).

    {ok, Data}           = file:read_file(FilePath),
    ParseBinary          = binary:split(Data, <<"\n">>, [global]),
    ParseBinaryToString  = [ binary_to_list(L) || L <- ParseBinary ],
    ParseStringToInteger = [ string:to_integer(X) || X <- ParseBinaryToString ],
    {Result, _} = lists:unzip(Pairs),
    Result.


%% === Unit Tests =======================
%part1_test() ->
%    536404 =
