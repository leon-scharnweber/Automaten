-module('deaEngineTest_SUITE').
-export([all/0, init_per_testcase/2, end_per_testcase/2]).
-export([
    tf01/1,
    tf02/1,
    tf08/1
]).

-define(value(Key, Config), proplists:get_value(Key, Config)).

all() ->
    [tf01, tf02, tf08].

init_per_testcase(tf01, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea01),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf02, Config) ->
    String = "",
    DEA = ct:get_config(dea02),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf08, Config) ->
    String = "bbab",
    DEA = ct:get_config(dea08),
    [{string, String}, {dea, DEA} | Config].

end_per_testcase(_, _Config) ->
    ok.

%%-----------------------------------------------------------------------------
tf01(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
tf02(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    ok = engine:check(Zeichenkette, DEA).

tf08(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
