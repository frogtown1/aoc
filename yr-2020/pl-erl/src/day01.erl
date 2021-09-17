
%% @doc     AoC Day01 Solutions.

-module(day01).

-export([results/0]).

%% ===== Main =====
-spec results() -> integer().
results() ->
    Input = ingest_file("input01"),
    io:format("===== Day01 Results =====~n"),
    io:format("Part 1: ~p~n", [solve_part1(Input)]),
    io:format("Part 2: ~p~n", [solve_part2(Input)]).

%% ==================================
%% Part 1
%% ==================================
%% Method 1: Tail Recursion
%solve_part1(Input) -> solve_part1(Input, Input, Input).

%solve_part([H1 | _], [H2 | _], _) when H1 + H2 =:= 2020 ->
%    H1 * H2;
%solve_part([], [_ | T], Input) ->
%    solver_part(Input, T, Input);
%solve_part1([_ | T], List, Input) ->
%    solve_part1(T, List, Input).

%% Method 2: List Comprehension
-spec solve_part1(list()) -> integer().
solve_part1(Input) ->
    [{Int1, Int2} | _] = [ {Int1, Int2} ||
                           Int1 <- Input, Int2 <- Input,
                           Int1 + Int2 =:= 2020 ],
    Int1 * Int2.

%% ==================================
%% Part 2
%% ==================================
%% Method 1: List Comprehension
-spec solve_part2(list()) -> integer().
solve_part2(Input) ->
    [{Int1, Int2, Int3} | _] = [ {Int1, Int2, Int3} ||
                                 Int1 <- Input, Int2 <- Input, Int3 <- Input,
                                 Int1 + Int2 + Int3 =:= 2020 ],
    Int1 * Int2 * Int3.

%% ===== Util =====
%% Ingest input file
-spec ingest_file(string()) -> list().
ingest_file(FileName) ->
    FilePath        = filename:join(["..", "resources", FileName]),
    {ok, Data}      = file:read_file(FilePath),
    ParsedBinary    = binary:split(Data, <<"\n">>, [global]),
    BinaryToString  = [ binary_to_list(E)    || E <- ParsedBinary ],
    StringToInteger = [ string:to_integer(E) || E <- BinaryToString ],
    {Result, _}     = lists:unzip(StringToInteger),
                      Result.

%% ===== Unit Tests =====
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

test() ->
    io:format("===== Day01 Test Results =====~n"),
    io:format("Part 1: ~p~n",[part1_test()]),
    io:format("Part 2: ~p~n",[part2_test()]).

part1_test() ->
    SampleInput = [1721, 979, 366, 299, 675, 1456],
    ?assert(514579 =:= solve_part1(SampleInput)).

part2_test() ->
    SampleInput = [1721, 979, 366, 299, 675, 1456],
    ?assert(241861950 =:= solve_part2(SampleInput)).

-endif
