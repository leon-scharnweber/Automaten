-module(deaValidateTest_SUITE).
-export([all/0, init_per_testcase/2, end_per_testcase/2]).
-export([
    tf03/1, tf04/1, tf05/1, tf06/1, tf07/1, tf08/1, tf09/1, tf10/1
]).

-define(value(Key, Config), proplists:get_value(Key, Config)).

all() -> [tf03, tf04, tf05, tf06, tf07, tf08, tf09, tf10].

init_per_testcase(tf03, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea03),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf04, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea04),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf05, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea05),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf06, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea06),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf07, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea07),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf08, Config) ->
    String = "bbab",
    DEA = ct:get_config(dea08),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf09, Config) ->
    String = "abbab",
    DEA = ct:get_config(dea09),
    [{string, String}, {dea, DEA} | Config];
init_per_testcase(tf10, Config) ->
    String = "abcbcab",
    DEA = ct:get_config(dea10),
    [{string, String}, {dea, DEA} | Config].

end_per_testcase(_, _Config) ->
    ok.

tf03(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf04(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf05(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf06(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf07(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error} = engine:check(Zeichenkette, DEA).
tf08(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
tf09(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error, "Found no Transition"} = engine:check(Zeichenkette, DEA).
tf10(ConfigData) ->
    DEA = ?value(dea, ConfigData),
    Zeichenkette = ?value(string, ConfigData),
    {error, "Ended in an not Endstate"} = engine:check(Zeichenkette, DEA).
