%% @author  Benjamin McGriff
%% @doc     AoC Day01 Solutions.

-module(day01).

-export([results/0]).

-spec results() -> integer().
results() ->
    Input = ingest_file("input01"),
    io:format("Part 1: ~p~n", [solve_part1(Input)]).
   % io:format("Part 2: ~p~n", [400]).



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
%% L = [1721, 979, 366, 299, 675, 1465]


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


