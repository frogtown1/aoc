%% @author  Benjamin McGriff
%% @doc     AoC Day01 Solutions.
%% @version 0.1

-module(day01).

-export([results/0, ingest_file/1]).


results() ->
    Input = ingest_file("input01"),
    io:format("Part 1: ~p~n", [solver_part1(Input)]).
   % io:format("Part 2: ~p~n", [400]).


%% ==================================
%% Part 1
solver_part1(Input) -> solver_part1(Input, Input, Input).

solver_part1([H1 | _], [H2 | _], _) when H1 + H2 =:= 2020 ->
    H1 * H2;
solver_part1([], [_ | T], Input) ->
    solver_part1(Input, T, Input);
solver_part1([_ | T], List, Input) ->
    solver_part1(T, List, Input).


%% L = [1721, 979, 366, 299, 675, 1465]


%% Ingest input file

ingest_file(FileName) ->
    FilePath        = filename:join(["..", "resources", FileName]),
    {ok, Data}      = file:read_file(FilePath),
    ParsedBinary    = binary:split(Data, <<"\n">>, [global]),
    BinaryToString  = [ binary_to_list(E)    || E <- ParsedBinary ],
    StringToInteger = [ string:to_integer(E) || E <- BinaryToString ],
    {Result, _}     = lists:unzip(StringToInteger),
                      Result.


