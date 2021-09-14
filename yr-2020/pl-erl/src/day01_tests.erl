-module(day01_tests).
-include_lib("eunit/include/eunit.hrl").

part1_test() ->
    {V, H} = day01:results(),
    ?assertEqual(2020, V + H),
    ?debugFmt("Part1 test result: ~p~n", [V * H]).
