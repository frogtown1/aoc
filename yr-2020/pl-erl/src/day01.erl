-module(day01).
-export([results/0]).

%% === Wrapper Function =================
results() ->
    io:format("Part 1: ~p~n", [part1()]).

%% ======================================



%% === Part 1 ===========================
part1() -> solver_part1(input_file()).

solver_part1([]) -> 0;
solver_part1([H | T]) -> solver_part1(H, T) + solver_part1(T).

solver_part1(_, []) -> 0;
solver_part1(V, [H | _]) when V + H =:= 2020 ->
    V * H;
solver_part1(V, [_ | T]) ->
    solver_part1(V, T).



input_file() ->
    {ok, Input} = file:read_file(input01),
    Strings = string:split(Input, "\n", all),
    Pairs = [string:to_integer(X) || X <- Strings],
    {Result, _} = lists:unzip(Pairs),
    Result.



