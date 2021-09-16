-module(day01).
-include_lib("eunit/include/eunit.hrl").

-export([input_file/0]).

%% === Wrapper Function =================
%results() ->
%    io:format("Part 1: ~p~n", [part1()]).

%% ======================================



%% === Part 1 ===========================
%part1() -> solver_part1(input_file()).



input_file() ->
    FileName             = "input01",
    FilePath             = filename:join(["..", "resources", FileName]),
    {ok, Data}           = file:read_file(FilePath),
    ParseBinary          = binary:split(Data, <<"\n">>, [global]),
    ParseBinaryToString  = [ binary_to_list(L) || L <- ParseBinary ],
    ParseStringToInteger = [ string:to_integer(X) || X <- ParseBinaryToString ],
    {Result, _}          = lists:unzip(ParseStringToInteger),
                           Result.


%% === Unit Tests =======================
%part1_test() ->
%    536404 =
