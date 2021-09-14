-module(tests_day01).

-include_lib("eunit/include/eunit.hrl").

test_part1() ->
    {A, B} = day01:results(),
    ?assertEqual(2020, A + B),
    ?debugFmt("Part1 : ~p~n", [A * B]).
